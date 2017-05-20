class Repository < ActiveRecord::Base
  validates_presence_of :name, :url

  has_many :counts, :dependent => :destroy
  has_one :repository_stats, :dependent => :destroy
  has_one :sampler, :dependent => :destroy

  def js_timeseries(start=nil, finish=nil)
    scope = counts
    if start
      scope = scope.where("record_date > ?", start)
    end

    if finish
      scope = scope.where("record_date < ?", finish)
    end

    scope.order(:record_date).collect { |c| [c.record_date.to_i * 1000, c.value] }
  end

  def last_week
    day_sequence(Time.now.utc - 6.days, 7)
  end

  def day_sequence(start, days)
    start_date = start.to_date
    records = self.counts.where("record_date > ? and record_date < ?", start_date, start_date + days.days).order(:record_date)
    sequence = []
    (0 ..days - 1 ).collect do |i|
      day = (start_date + i.days).day
      last = nil
      records.each do |r|
        if r.record_date.day == day
          last = r
        end
      end

      sequence << last
    end

    sequence
  end

  def fetch_count
    self.sampler.sample
  end

  def update_count
    self.counts.create(:value => self.fetch_count,
                       :record_date => Time.now)
  end

  def latest_count
    self.counts.order("record_date desc").first
  end


  def update_stats
    last_week = self.counts.where("record_date > ?", Time.now - 7.days).order(:record_date)

    if last_week.length > 0

      stats = self.repository_stats || RepositoryStats.new(:repository_id => self.id, :modules_day => 0, :total => 0)

      stats.total = last_week.last.value

      if  last_week.length > 1
        stats.modules_day = ((last_week.last.value - last_week.first.value) / ((last_week.last.record_date - last_week.first.record_date) / 1.day )).round
      end

      stats.save
    end
  end

  def count_for_date(date)
    self.counts.where("date_trunc('day', counts.record_date) = date(?)", date).first
  end

end

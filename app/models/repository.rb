class Repository < ActiveRecord::Base
  validates_presence_of :name, :url, :regex
  
  has_many :counts, :dependent => :destroy
  has_one :repository_stats

  def fetch_count
    page = HTTParty.get(self.url)
    if md = page.match(self.regex)
      md[1].gsub(",", "").to_i
    end
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

end

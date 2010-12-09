class Repository < ActiveRecord::Base
  validates_presence_of :name, :url, :regex
  
  has_many :counts, :dependent => :destroy

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


end

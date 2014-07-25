class AddGoLang < ActiveRecord::Migration
  @name = 'GoDoc (Go)'
  @url = 'http://godoc.org/-/index'
  def self.up
    r = Repository.new(:name => @name, :url => @url)
    s = RegexSampler.new
    s.data_url = @url
    s.regex = 'Number of packages: (\d+)\.'
    s.offset = 0
    r.sampler = s

    r.save!
  end

  def self.down
    r = Repository.where(:name => @name).first
    r.destroy
  end
end

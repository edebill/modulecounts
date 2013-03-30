class AddMaven < ActiveRecord::Migration
  def self.up
    r = Repository.new(:name => 'Maven Central (Java)', :url => 'http://www.maven.org', :graph => true)

    s = JsonSampler.new
    s.data_url = "http://search.maven.org/quickstats"
    s.key = 'gaNumber'
    s.offset = 0
    r.sampler = s

    r.save!
    r.update_count
  end

  def self.down
    r = Repository.where(:name => 'Maven Central (Java)').first
    r.destroy
  end
end

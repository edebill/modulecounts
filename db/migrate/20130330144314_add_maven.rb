class AddMaven < ActiveRecord::Migration[4.2]
  def up
    r = Repository.new(:name => 'Maven Central (Java)',
                       :url => 'http://www.maven.org',
                       :graph => true)

    s = JsonSampler.new
    s.data_url = "http://search.maven.org/quickstats"
    s.key = 'gaNumber'
    s.offset = 0
    r.sampler = s

    r.save!
  end

  def down
    r = Repository.where(:name => 'Maven Central (Java)').first
    r.destroy
  end
end

class AddNuget < ActiveRecord::Migration
  def up
    r = Repository.new(:name => 'nuget (.NET)', :url => 'http://nuget.org')
    s = RegexSampler.new
    s.data_url = "http://nuget.org/packages"
    s.regex = 'There are (\d+) packages'
    s.offset = 0
    r.sampler = s
    
    r.save!
  end

  def down
    r = Repository.find(:name => 'nuget')
    r.destroy
  end
end

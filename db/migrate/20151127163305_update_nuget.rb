class UpdateNuget < ActiveRecord::Migration
  def up
    r = Repository.where(name: 'nuget (.NET)').first
    r.sampler.destroy
    s = JsonSampler.new
    s.data_url = "http://www.nuget.org/stats/totals"
    s.key = "UniquePackages"
    s.offset = 0
    r.sampler = s

    r.save!
  end

  def down
    r = Repository.where(name: 'nuget (.NET)').first
    r.sampler.destroy
    s = RegexSampler.new
    s.data_url = "http://nuget.org/packages"
    s.regex = 'There are (\d+) packages'
    s.offset = 0
    r.sampler = s

    r.save!
  end
end

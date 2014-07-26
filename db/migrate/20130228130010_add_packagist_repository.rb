class AddPackagistRepository < ActiveRecord::Migration
  def up
    r = Repository.new(:name => 'Packagist (PHP)', :url => 'http://packagist.org')
    s = RegexSampler.new
    s.data_url = "http://packagist.org/statistics"
    s.regex = '(\d+\s+\d+) packages registered'
    s.offset = 0
    r.sampler = s

    r.save!
  end

  def down
    r = Repository.where(:name => 'Packagist (PHP)').first
    r.destroy
  end
end

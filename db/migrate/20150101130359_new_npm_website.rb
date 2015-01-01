class NewNpmWebsite < ActiveRecord::Migration
  def up
    r = Repository.find_by_name("npm (node.js)")
    sampler = r.sampler

    sampler.regex = ">(\\d+)</strong>\\s+total packages"
    sampler.save!

    Count.where(:value => 0).all.each { |c| c.destroy }  
  end

  def down
    r = Repository.find_by_name("npm (node.js)")
    sampler = r.sampler

    sampler.regex = "Total Packages:\\s+(\\d.*\\d)"
    sampler.save!
    
  end
end

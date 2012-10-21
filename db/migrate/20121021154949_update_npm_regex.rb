class UpdateNpmRegex < ActiveRecord::Migration
  def self.up
  	r = Repository.find_by_name('npm (node.js)')
  	s = r.sampler
  	s.regex = "Total Packages:\\s+(\\d.*\\d)"   # they started putting spaces between 1000s groups
  	s.save
  end

  def self.down
  	r = Repository.find_by_name('npm (node.js)')
  	s = r.sampler
  	s.regex = "Total Packages:\\s+(\\d+)"
  	s.save
  end
end

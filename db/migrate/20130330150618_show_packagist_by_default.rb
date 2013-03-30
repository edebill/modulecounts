class ShowPackagistByDefault < ActiveRecord::Migration
  def self.up
    pi = Repository.find_by_name("Packagist (PHP)")
    pi.graph = true
    pi.save
  end

  def self.down
    pi = Repository.find_by_name("Packagist (PHP)")
    pi.graph = false
    pi.save
  end
end

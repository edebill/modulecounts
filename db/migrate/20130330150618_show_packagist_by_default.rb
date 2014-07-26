class ShowPackagistByDefault < ActiveRecord::Migration
  def up
    pi = Repository.find_by_name("Packagist (PHP)")
    pi.graph = true
    pi.save!
  end

  def down
    pi = Repository.find_by_name("Packagist (PHP)")
    pi.graph = false
    pi.save!
  end
end

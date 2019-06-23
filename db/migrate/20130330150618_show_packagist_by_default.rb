class ShowPackagistByDefault < ActiveRecord::Migration[4.2]
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

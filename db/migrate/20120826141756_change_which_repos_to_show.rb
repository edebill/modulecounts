class ChangeWhichReposToShow < ActiveRecord::Migration
  def self.up
    ['npm (node.js)', 'nuget (.NET)'].each do |name|
      r = Repository.find_by_name(name)
      r.graph = true
      r.save
    end

    r = Repository.find_by_name('CPAN (search)')
    r.graph = false
    r.save
  end

  def self.down
    ['npm (node.js)', 'nuget (.NET)'].each do |name|
      r = Repository.find_by_name(name)
      r.graph = false
      r.save
    end

    r = Repository.find_by_name('CPAN (search)')
    r.graph = true
    r.save
  end
end

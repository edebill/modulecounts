class AddHackage < ActiveRecord::Migration
  def up
    Repository.create!(:name => "Hackage (Haskell)",
                       :url => "http://holumbus.fh-wedel.de/hayoo/hayoo.html",
                       :regex => "more than ([\\d,.]+) packages")
  end

  def down
    Repository.where(:name => "Hackage (Haskell)").last.try(:destroy)
  end
end

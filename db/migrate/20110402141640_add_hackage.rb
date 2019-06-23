class AddHackage < ActiveRecord::Migration[4.2]
  def up
    Repository.create!(:name => "Hackage (Haskell)",
                       :url => "http://holumbus.fh-wedel.de/hayoo/hayoo.html",
                       :regex => "more than ([\\d,.]+) packages")
  end

  def down
    Repository.where(:name => "Hackage (Haskell)").last.try(:destroy)
  end
end

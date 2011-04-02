class AddHackage < ActiveRecord::Migration
  def self.up
    r = Repository.create(:name => "Hackage (Haskell)",
                          :url => "http://holumbus.fh-wedel.de/hayoo/hayoo.html",
                          :regex => "more than ([\\d,.]+) packages")
    r.update_count
    r.update_stats
  end

  def self.down
    Repository.where(:name => "Hackage (Haskell)").last.try(:destroy)
  end
end

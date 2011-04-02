class AddCran < ActiveRecord::Migration
  def self.up
    r = Repository.create(:name => "CRAN (R)",
                          :url => "http://cran.opensourceresources.org/web/packages/",
                          :regex => "features\\s+([\\d,]+)\\s+available packages")
    r.update_count
    r.update_stats
  end
  def self.down
    Repository.where(:name => "CRAN (R)").last.try(:destroy)
    
  end
end

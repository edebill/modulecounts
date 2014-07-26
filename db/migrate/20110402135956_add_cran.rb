class AddCran < ActiveRecord::Migration
  def up
    Repository.create!(:name => "CRAN (R)",
                       :url => "http://cran.opensourceresources.org/web/packages/",
                       :regex => "features\\s+([\\d,]+)\\s+available packages")
  end

  def down
    Repository.where(:name => "CRAN (R)").last.try(:destroy)
  end
end

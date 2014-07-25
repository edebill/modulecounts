class MoveCran < ActiveRecord::Migration
  def self.up
    cran = Repository.find_by_name('CRAN (R)')
    cran.url = 'http://cran.rproject.org'
    cran.save
    
    sampler = cran.sampler

    sampler.data_url = 'http://cran.r-project.org/web/packages/'
    sampler.regex = "features\\s+([\\d,]+)\\s+available packages"
    sampler.save

    cran.reload
  end

  def self.down
    cran = Repository.find_by_name('CRAN (R)')
    cran.url = 'http://cran.opensourceresources.org'
    cran.save

    sampler = cran.sampler

    sampler.data_url = "http://cran.opensourceresources.org/web/packages/"
    sampler.regex = "features\\s+([\\d,]+)\\s+available packages"
    sampler.save
  end
end

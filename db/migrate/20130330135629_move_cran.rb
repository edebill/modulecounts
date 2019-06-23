class MoveCran < ActiveRecord::Migration[4.2]
  def up
    cran = Repository.find_by_name('CRAN (R)')
    cran.url = 'http://cran.rproject.org'
    cran.save!
    
    sampler = cran.sampler

    sampler.data_url = 'http://cran.r-project.org/web/packages/'
    sampler.regex = "features\\s+([\\d,]+)\\s+available packages"
    sampler.save!
  end

  def down
    cran = Repository.find_by_name('CRAN (R)')
    cran.url = 'http://cran.opensourceresources.org'
    cran.save!

    sampler = cran.sampler

    sampler.data_url = "http://cran.opensourceresources.org/web/packages/"
    sampler.regex = "features\\s+([\\d,]+)\\s+available packages"
    sampler.save!
  end
end

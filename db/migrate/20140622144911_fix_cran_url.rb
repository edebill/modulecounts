class FixCranUrl < ActiveRecord::Migration
  def up
    repo = Repository.where(:name => "CRAN (R)").first
    repo.url = 'http://cran.r-project.org'
    repo.save!
  end

  def down
    repo = Repository.where(:name => "CRAN (R)").first
    repo.url = 'http://cran.rproject.org'
    repo.save!
  end
end

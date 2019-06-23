class UpdateForPackagistNewDesign < ActiveRecord::Migration[4.2]
  def up
    repo_name =  'Packagist (PHP)'
    repo = Repository.where(name: repo_name).first
    sampler = repo.sampler
    sampler.regex = "Packages registered<\\/dt>[^>]+>(\\d[^<]+)<\\/dd"
    sampler.save!
  end

  def down
    repo_name =  'Packagist (PHP)'
    repo = Repository.where(name: repo_name).first
    sampler = repo.sampler
    sampler.regex = "(\\d+\\s+\\d+) packages registered"
    sampler.save!
  end
end

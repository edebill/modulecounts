class FixPypi < ActiveRecord::Migration[5.1]
  def up
    repo = Repository.where(name: "PyPI").first
    repo.url = "https://pypi.org"
    repo.save!

    sampler = repo.sampler
    sampler.data_url = "https://pypi.org"
    sampler.regex = ">([\\d,]+) projects"
    sampler.save!
  end
end

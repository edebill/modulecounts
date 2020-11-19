class FixPypi2020 < ActiveRecord::Migration[5.2]
  def up
    repo = Repository.where(name: "PyPI").first

    sampler = repo.sampler
    sampler.data_url = "https://pypi.org"
    sampler.regex = "\s([\\d,]+) projects"
    sampler.save!
  end
end

class FixDub < ActiveRecord::Migration[5.1]
  def up
    repo = Repository.where(name: "DUB (dlang)").first
    sampler = repo.sampler

    sampler.regex = "<a href=\"\\?\">([1-9,]+) packages"
    sampler.save!
  end
end

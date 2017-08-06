class ChangeDlangRegex < ActiveRecord::Migration[5.1]
  def change
    repository = Repository.where(name: "DUB (dlang)").first
    sampler = repository.sampler
    sampler.regex = "of (\\d+) packages found"
    sampler.save!

  end
end

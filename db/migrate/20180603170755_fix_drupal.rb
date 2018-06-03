class FixDrupal < ActiveRecord::Migration[5.1]
  def up
    repo = Repository.where(name: "Drupal (php)").first
    sampler = repo.sampler
    sampler.regex = ">([0-9,]+) modules match your search"
    sampler.save!
  end
end

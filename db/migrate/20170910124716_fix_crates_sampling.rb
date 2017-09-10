class FixCratesSampling < ActiveRecord::Migration[5.1]
  def change
    repository = Repository.where(name: "Crates.io (Rust)").first
    repository.counts.where(value: 0).destroy_all

    sampler = repository.sampler
    sampler.data_url = "https://crates.io/api/v1/summary"
    sampler.save!
    
  end
end

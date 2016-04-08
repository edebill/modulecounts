class RubygemsRequiresHttps < ActiveRecord::Migration
  def up
    repo = Repository.where(name: "Rubygems.org").first
    sampler = repo.sampler
    sampler.data_url = "https://rubygems.org/stats"
    sampler.regex = "Total gems[^<]*<[^<]*stat__count\">([0-9,]+)<"
    sampler.save!
  end
end

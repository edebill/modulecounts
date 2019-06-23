class RubygemsNewSiteDesign < ActiveRecord::Migration[4.2]
  def up
    rubygems = Repository.where(:name => "Rubygems.org").first
    sampler = rubygems.sampler

    sampler.data_url = "http://rubygems.org/stats"
    sampler.regex = "Total Gems[^<]*<[^<]*stat__count\">([0-9,]+)<"
    sampler.save!
  end

  def down
    rubygems = Repository.where(:name => "Rubygems.org").first
    sampler = rubygems.sampler

    sampler.data_url = "http://rubygems.org"
    sampler.regex = "{\"regex\":\"of ([\\\\d,]+) gems cut since\"}"
    sampler.save!
  end
end

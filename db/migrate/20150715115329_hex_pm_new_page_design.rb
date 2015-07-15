class HexPmNewPageDesign < ActiveRecord::Migration
  def up
    repo_name =  'Hex.pm (Elixir/Erlang)'
    repo = Repository.where(name: repo_name).first
    sampler = repo.sampler
    sampler.regex = ">([ 0-9]+)<\/td>\\s*<td [^>]+>packages<"
    sampler.save!
  end

  def down
    repo_name =  'Hex.pm (Elixir/Erlang)'
    repo = Repository.where(name: repo_name).first
    sampler = repo.sampler
    sampler.regex = '(\d+)<\/div>\s*<div[^>]*>packages'
    sampler.save
  end
end

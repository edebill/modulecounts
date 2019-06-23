class AddHexPm < ActiveRecord::Migration[4.2]
  def up
    @repo_name = 'Hex.pm (Elixir/Erlang)'
    @url = 'https://hex.pm/'
    r = Repository.new(:name => @repo_name, :url => @url)
    s = RegexSampler.new
    s.data_url = "https://hex.pm"
    s.regex = '(\d+)<\/div>\s*<div[^>]*>packages'
    s.offset = 0
    r.sampler = s

    r.save!
  end

  def down
    @repo_name = 'Hex.pm (Elixir/Erlang)'
    r = Repository.where(:name => @repo_name).first
    r.destroy
  end
end

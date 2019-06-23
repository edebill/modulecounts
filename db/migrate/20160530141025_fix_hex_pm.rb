class FixHexPm < ActiveRecord::Migration[5.0]
  def change
    r = Repository.where(name: "Hex.pm (Elixir/Erlang)").first
    sampler = r.sampler
    sampler.data_url = "https://hex.pm/packages"
    sampler.regex = ">(\\d+) Results Found"
    sampler.save
  end
end

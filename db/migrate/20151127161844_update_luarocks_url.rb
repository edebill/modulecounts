class UpdateLuarocksUrl < ActiveRecord::Migration[4.2]
  def up
    repo = Repository.where(name: "LuaRocks (Lua)").first
    sampler = repo.sampler
    sampler.data_url = "https://luarocks.org/m/root"
    sampler.configuration_json = "{}"
    sampler.regex = '<span class="header_count">\\((\\d+)\\)</span>'
    sampler.save!
  end

  def down
    repo = Repository.where(name: "LuaRocks (Lua)").first
    sampler = repo.sampler
    sampler.data_url = "https://rocks.moonscript.org/m/root"
    sampler.configuration_json = "{}"
    sampler.regex = '<span class="header_count">\\((\\d+)\\)</span>'
    sampler.save!
  end
end

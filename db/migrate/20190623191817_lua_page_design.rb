class LuaPageDesign < ActiveRecord::Migration[5.2]
  def change
    r = Repository.find_by(name: "LuaRocks (Lua)")
    sampler = r.sampler
    sampler.regex = "span class=\"sub\">\\(([0-9,]+)\\)</span"
    sampler.save
  end
end

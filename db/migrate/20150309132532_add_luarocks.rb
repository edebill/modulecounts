class AddLuarocks < ActiveRecord::Migration
  def up
    @name = 'LuaRocks (Lua)'
    @url = 'https://rocks.moonscript.org'
    r = Repository.new(:name => @name, :url => @url)
    s = RegexSampler.new
    s.data_url = @url + '/m/root'
    s.regex = '<span class="header_count">\\((\\d+)\\)</span>'
    s.offset = 0
    r.sampler = s
    r.save!
  end

  def down
    @name = 'LuaRocks (Lua)'

    r = Repository.where(:name => @name).first
    r.destroy
  end
end

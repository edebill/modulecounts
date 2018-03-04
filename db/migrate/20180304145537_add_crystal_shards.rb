class AddCrystalShards < ActiveRecord::Migration[5.1]
  def up
    @name = 'Crystal Shards'
    @url = 'https://crystalshards.xyz'
    r = Repository.new(:name => @name, :url => @url)
    s = RegexSampler.new
    s.data_url = @url
    s.regex = '<b>(\d+)</b> total shards'
    s.offset = 0
    r.sampler = s
    r.save!
  end

  def down
    @name = 'Crystal Shards'

    r = Repository.where(:name => @name).first
    r.destroy
  end
end

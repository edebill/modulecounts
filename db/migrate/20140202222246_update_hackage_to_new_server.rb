class UpdateHackageToNewServer < ActiveRecord::Migration
  def up
    r = Repository.find_by_name("Hackage (Haskell)")
    r.url = "http://hackage.haskell.org/"
    r.save!

    r.sampler.destroy
    s = JsonArrayLengthSampler.new(:data_url => "http://hackage.haskell.org/packages/.json")
    s.offset = 0
    r.sampler = s
    r.save!
  end

  def down
    # not going down, but you can re-run w/out borking too much
  end
end

class Change < ActiveRecord::Migration[4.2]
  def up
    r = Repository.find_by_name "Bower (JS)"
    sampler = r.sampler

    sampler.data_url = "https://bower-server-etl.herokuapp.com/api/1/data/all"
    sampler.parse_sampler_configuration
    sampler.save
  end

  def down
  end
end

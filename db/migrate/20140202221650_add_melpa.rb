class AddMelpa < ActiveRecord::Migration
  def up
    r = Repository.new(:name => 'Melpa (Emacs)', :url => 'http://melpa.milkbox.net')
    s = JsonHashKeyCountSampler.new
    s.data_url = "http://melpa.milkbox.net/recipes.json"
    s.offset = 0
    r.sampler = s

    r.save!
  end

  def down
    r = Repository.find_by_name('Melpa (Emacs)')
    r.destroy
  end
end

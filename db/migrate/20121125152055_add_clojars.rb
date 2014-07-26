class AddClojars < ActiveRecord::Migration
  def up
    r = Repository.new(:name => 'Clojars (Clojure)', :url => 'http://clojars.org')
    s = RegexSampler.new
    s.data_url = "http://clojars.org/projects"
    s.regex = 'Displaying projects <b>.*</b> of <b>\s*(\d+)\s*</b>\s*</div>'
    s.offset = 0
    r.sampler = s

    r.save!
  end

  def down
    r = Repository.where(:name => 'Clojars (Clojure)').first
    r.destroy
  end
end

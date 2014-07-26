class AddNpm < ActiveRecord::Migration
  def up
    r = Repository.new(:name => 'npm (node.js)', :url => 'http://npmjs.org')
    s = JsonSampler.new
    s.data_url = "http://search.npmjs.org/api/_all_docs?limit=0"
    s.key = 'total_rows'
    s.offset = -1
    r.sampler = s
    
    r.save!
  end

  def down
    r = Repository.find(:name => 'npm')
    r.destroy
  end
end

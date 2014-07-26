class NewNpmSiteDesign < ActiveRecord::Migration
  def up
    r = Repository.find_by_name('npm (node.js)')
    r.sampler.destroy

    s = RegexSampler.new
    s.data_url = 'https://npmjs.org'
    s.regex = 'Total Packages:\s+(\d+)'
    s.offset = 0

    r.sampler = s
    r.save!
  end

  def down
    r = Repository.find_by_name('npm (node.js)')
    s = JsonSampler.new
    s.data_url = "http://search.npmjs.org/api/_all_docs?limit=0"
    s.key = 'total_rows'
    s.offset = -1
    r.sampler = s
    
    r.save!
  end
end

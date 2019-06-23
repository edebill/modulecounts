class AddBower < ActiveRecord::Migration[4.2]
  def up
    @repo_name = 'Bower (JS)'
    @url = 'http://bower.io/'
    r = Repository.new(:name => @repo_name, :url => @url)
    s = JsonPathSampler.new
    s.data_url = "http://stats.bower.io/api/1/data/all"
    s.path = '$..totalPackages'
    s.offset = 0
    r.sampler = s

    r.save!
  end

  def down
    @repo_name = 'Bower (JS)'
    r = Repository.where(:name => @repo_name).first
    r.destroy
  end
end

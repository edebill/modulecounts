class AddCratesRust < ActiveRecord::Migration
  def up
    @repo_name = 'Crates.io (Rust)'
    @url = 'https://crates.io/'
    r = Repository.new(:name => @repo_name, :url => @url)
    s = JsonPathSampler.new
    s.data_url = "https://crates.io/summary"
    s.path = '$.num_crates'
    s.offset = 0
    r.sampler = s

    r.save!
  end

  def down
    @repo_name = 'Crates.io (Rust)'
    r = Repository.where(:name => @repo_name).first
    r.destroy
  end
end

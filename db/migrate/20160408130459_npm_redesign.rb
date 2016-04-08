class NpmRedesign < ActiveRecord::Migration
  def up
    repo = Repository.where(name: "npm (node.js)").first
    sampler = repo.sampler
    sampler.destroy
    ns = JsonSampler.new
    ns.key = "doc_count"
    ns.data_url = "https://skimdb.npmjs.com/registry"
    repo.sampler = ns
  end
end

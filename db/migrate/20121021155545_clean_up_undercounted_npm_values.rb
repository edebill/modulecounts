class CleanUpUndercountedNpmValues < ActiveRecord::Migration
  def self.up
  	r = Repository.find_by_name('npm (node.js)')
  	Count.destroy_all(:repository_id => r.id, :value => [15, 16])
  	r.update_count
  	r.update_stats
  end

  def self.down
  	# nothing to be done - this was destructive
  end
end

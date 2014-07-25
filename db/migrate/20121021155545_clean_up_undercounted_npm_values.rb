class CleanUpUndercountedNpmValues < ActiveRecord::Migration
  def self.up
  	r = Repository.find_by_name('npm (node.js)')
  	Count.destroy_all(:repository_id => r.id, :value => [15, 16])
  end

  def self.down
  	# nothing to be done - this was destructive
  end
end

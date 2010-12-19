class AddGraphFlagToRepositories < ActiveRecord::Migration
  def self.up
    add_column :repositories, :graph, :boolean
  end

  def self.down
    remove_column :repositories, :graph
  end
end

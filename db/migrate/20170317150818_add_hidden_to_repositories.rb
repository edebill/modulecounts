class AddHiddenToRepositories < ActiveRecord::Migration[5.0]
  def change
    add_column :repositories, :hidden, :boolean, default: false
  end
end

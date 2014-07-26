class CreateRepositoryStats < ActiveRecord::Migration
  def up
    create_table :repository_stats do |t|
      t.integer :repository_id
      t.integer :total
      t.datetime :last_updated
      t.integer :modules_day
      t.integer :days_to_crossover

      t.timestamps
    end

    add_index :repository_stats, :repository_id, :unique => true
  end

  def down
    drop_table :repository_stats
  end
end

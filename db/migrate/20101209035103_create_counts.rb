class CreateCounts < ActiveRecord::Migration
  def up
    create_table :counts do |t|
      t.integer :repository_id
      t.integer :value
      t.datetime :record_date

      t.timestamps
    end
  end

  def down
    drop_table :counts
  end
end

class CreateCounts < ActiveRecord::Migration
  def self.up
    create_table :counts do |t|
      t.integer :repository_id
      t.integer :value
      t.datetime :record_date

      t.timestamps
    end
  end

  def self.down
    drop_table :counts
  end
end

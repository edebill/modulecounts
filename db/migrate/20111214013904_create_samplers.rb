class CreateSamplers < ActiveRecord::Migration
  def up
    create_table :samplers do |t|
      t.integer :repository_id
      t.string :type
      t.string :data_url
      t.text   :configuration_json
      t.timestamps
    end
  end

  def down
    drop_table :samplers
  end
end

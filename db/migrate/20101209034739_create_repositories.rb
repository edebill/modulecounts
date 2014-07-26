class CreateRepositories < ActiveRecord::Migration
  def up
    create_table :repositories do |t|
      t.string :name
      t.string :url
      t.string :regex
      t.datetime :last_checked
      t.boolean :graph

      t.timestamps
    end
  end

  def down
    drop_table :repositories
  end
end

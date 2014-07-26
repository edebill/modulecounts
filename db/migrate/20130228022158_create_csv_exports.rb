class CreateCsvExports < ActiveRecord::Migration
  def up
    create_table :csv_exports do |t|
      t.text :csv

      t.timestamps
    end
    
    export = CsvExport.new
    export.csv = ""  # no data - rake cron will fill some in
    export.save!
  end

  def down
    drop_table :csv_exports
  end
end

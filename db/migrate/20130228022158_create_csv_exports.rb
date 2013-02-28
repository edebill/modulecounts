class CreateCsvExports < ActiveRecord::Migration
  def self.up
    create_table :csv_exports do |t|
      t.text :csv

      t.timestamps
    end
    
    export = CsvExport.new
    export.csv = CsvExport.generate_csv
    export.save
  end

  def self.down
    drop_table :csv_exports
  end
end

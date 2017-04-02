class CsvExport < ActiveRecord::Base
  def self.generate_csv
    @repositories = Repository.all.sort { |a,b| a.name.downcase <=> b.name.downcase }
    @latest = Count.order("record_date desc").limit(1).first

    csv = []
    ((Count.earliest.record_date.to_date + 1.day)..Time.now.to_date).each do |date|
      counts = Count.where("date_trunc('day', counts.record_date) = date(?)", date).all
      row = @repositories.map { |r| counts.select { |c| c.repository_id == r.id }.first.try(:value) }

      # there might not be data for this date, but we'll include a row anyway
      csv.push row.unshift(date.strftime("%Y/%m/%d")).to_csv

    end

    csv.unshift @repositories.map { |r| r.name }.unshift("date").to_csv

    csv.join("")
  end

  def self.update
    export = CsvExport.first
    export.csv = CsvExport.generate_csv
    export.save
  end
end

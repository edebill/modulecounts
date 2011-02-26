class IndexController < ApplicationController
  def index
    @repositories = Repository.order(:name)

    response.headers['Cache-Control'] = 'public, max-age=300'
    respond_to do |format|
      format.html { render }
      format.csv  { 
        csv = []
        ((Count.earliest.record_date.to_date + 1.day)..Time.now.to_date).each do |date| 

          row = @repositories.collect { |r| r.count_for_date(date).try(:value) }

          # there might not be data for this date, but we'll include a row anyway
          csv.push row.unshift(date.strftime("%Y/%m/%d")).to_csv

        end

        csv.unshift @repositories.collect { |r| r.name }.unshift("date").to_csv
        
        render :content_type => 'text/csv', :text =>  csv.join("")
      }
    end
  end

  def csv
    @repositories = Repository.order(:name).include(:counts)

    response.headers['Cache-Control'] = 'public, max-age=300'
    respond_to do |format|
      format.xml  { render :xml => @repositories }
      format.csv  { 

        csv = @biometrics.collect { |b| [b.record_date.utc.strftime("%Y/%m/%d %H:%M:%S"), b.weight, b.systolic, b.diastolic, b.bpm].to_csv }
        csv.unshift ["record date","weight","systolic","diastolic","bpm"].to_csv

        render :content_type => 'text/csv', :text =>  csv.join("")
      }
    end

  end

end

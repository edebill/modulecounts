desc "This task will import a csv file"
task :import_csv => :environment do
  require 'csv'
  repos = { "CPAN" => Repository.where(:name => "CPAN").first,
    "RubyGems.org" => Repository.where(:name => "Rubygems.org").first,
    "PyPI" => Repository.where(:name => "PyPI").first }

  CSV.foreach("modulecounts.csv", :headers => true, :skip_blanks => true) do |row|
    record_date = Time.parse("#{row['date']} 09:00 CSV")
    if record_date
      ["CPAN", "RubyGems.org", "PyPI"].each do |repo_name|
        if row[repo_name]
          repos[repo_name].counts.create(:value => row[repo_name],
                                         :record_date => record_date)
          puts "imported #{repo_name} #{record_date}, #{row[repo_name]}"
        end
      end
    end
  end
        
end

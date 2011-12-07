desc "This task runs nightly"
task :cron => :environment do
  Repository.all.each do |r|
    begin
      r.update_count
      r.update_stats
    rescue => e
      Rails.logger.error("error updating #{r.name} - #{e.inspect}")
    end
  end
end

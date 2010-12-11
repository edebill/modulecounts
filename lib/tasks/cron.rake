desc "This task runs nightly"
task :cron => :environment do
  Repository.all.each do |r|
    r.update_count
    r.update_stats
  end
end

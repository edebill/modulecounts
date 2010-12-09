desc "This task runs nightly"
task :cron => :environment do
  Repository.all.each { |r| r.update_count }
end
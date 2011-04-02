class UpdateCpanRegex < ActiveRecord::Migration
  def self.up
    cpan = Repository.where(:name => 'CPAN').first
    cpan.regex = "in ([\\d,]+) distributions"
    cpan.save
    cpan.update_count
    cpan.update_stats
  end

  def self.down
    cpan = Repository.where(:name => 'CPAN').first
    cpan.regex = "authors ([\\d,]+) modules"
    cpan.save
    cpan.update_count
    cpan.update_stats
  end
end

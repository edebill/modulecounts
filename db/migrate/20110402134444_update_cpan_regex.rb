class UpdateCpanRegex < ActiveRecord::Migration[4.2]
  def up
    cpan = Repository.where(:name => 'CPAN').first
    cpan.regex = "in ([\\d,]+) distributions"
    cpan.save
  end

  def down
    cpan = Repository.where(:name => 'CPAN').first
    cpan.regex = "authors ([\\d,]+) modules"
    cpan.save
  end
end

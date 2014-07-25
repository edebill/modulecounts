class UpdateCpanRegex < ActiveRecord::Migration
  def self.up
    execute("update repositories set regex = 'in ([\\d,]+) distributions' where name = 'CPAN'")
  end

  def self.down
    execute("update repositories set regex = 'authors ([\\d,]+) modules' where name = 'CPAN'")
  end
end

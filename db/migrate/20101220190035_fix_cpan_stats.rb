class FixCPANStats < ActiveRecord::Migration
  def self.up
    r       = Repository.find( :first, :conditions => "name = 'CPAN'" )
    r.url   = "http://search.cpan.org/"
    r.regex = "([\\d,]+) Modules"
    r.update_count
  end

  def self.down
    r       = Repository.find( :first, :conditions => "name = 'CPAN'" )
    r.url   = "http://www.cpan.org/"
    r.regex = "authors ([\\d,]+) modules"
    r.update_count
  end
end

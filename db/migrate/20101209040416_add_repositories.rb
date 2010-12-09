class AddRepositories < ActiveRecord::Migration
  def self.up
    r = Repository.create(:name => "Rubygems.org",
                          :url => "http://rubygems.org",
                          :regex => "of ([\\d,]+) gems cut since")
    r.update_count

    r = Repository.create(:name => "CPAN",
                          :url => "http://www.cpan.org",
                          :regex => "authors ([\\d,]+) modules")
    r.update_count

    r = Repository.create(:name => "PyPI",
                          :url => "http://pypi.python.org/pypi",
                          :regex => "currently\\s*<strong>([\\d,]+)</strong>\\s*packages")
    r.update_count



  end

  def self.down
    Repository.where(:name => "Rubygems.org").destroy
    Repository.where(:name => "CPAN").destroy
    Repository.where(:name => "PyPI").destroy

  end
end

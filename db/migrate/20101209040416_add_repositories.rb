class AddRepositories < ActiveRecord::Migration
  def self.up
    now = Time.now
    execute("insert into repositories (name, url, regex, created_at, updated_at) values ('Rubygems.org', 'http://rubygems.org', 'of ([\\d,]+) gems cut since', '#{now}', '#{now}')")

    execute("insert into repositories (name, url, regex, created_at, updated_at) values ('CPAN', 'http://www.cpan.org', 'authors ([\\d,]+) modules', '#{now}', '#{now}')")

    execute("insert into repositories (name, url, regex, created_at, updated_at) values ('PyPI', 'http://pypi.python.org/pypi', 'currently\\s*<strong>([\\d,]+)</strong>\\s*packages', '#{now}', '#{now}')")

  end

  def self.down
    Repository.where(:name => "Rubygems.org").destroy
    Repository.where(:name => "CPAN").destroy
    Repository.where(:name => "PyPI").destroy

  end
end

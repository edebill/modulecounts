class AddRepositories < ActiveRecord::Migration
  def up
    Repository.create!(:name => "Rubygems.org",
                       :url => "http://rubygems.org",
                       :regex => "of ([\\d,]+) gems cut since")

    Repository.create!(:name => "CPAN",
                       :url => "http://www.cpan.org",
                       :regex => "authors ([\\d,]+) modules")

    Repository.create!(:name => "PyPI",
                       :url => "http://pypi.python.org/pypi",
                       :regex => "currently\\s*<strong>([\\d,]+)</strong>\\s*packages")

  end

  def down
    Repository.where(:name => "Rubygems.org").destroy
    Repository.where(:name => "CPAN").destroy
    Repository.where(:name => "PyPI").destroy

  end
end

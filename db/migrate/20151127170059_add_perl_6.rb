class AddPerl6 < ActiveRecord::Migration[4.2]
  def up
    r = Repository.new(name: repo_name,
                       url: "http://modules.perl6.org/",
                       graph: false)
    s = RegexSampler.new
    s.data_url = "http://modules.perl6.org/total"
    s.regex = "(\\d+)"
    s.offset = 0
    r.sampler = s

    r.save!
  end

  def down
    r = Repository.where(:name => repo_name).first
    r.destroy
  end

  def repo_name
    "Perl 6 Ecosystem (perl 6)"
  end
end

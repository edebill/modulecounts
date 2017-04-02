class AddJulia < ActiveRecord::Migration[5.0]
  def up
    @name = 'Julia'
    @url = 'https://julialang.org/'
    r = Repository.new(:name => @name, :url => @url)
    s = RegexSampler.new
    s.data_url = 'http://pkg.julialang.org'
    s.regex = 'Listing all ([0-9,]+)\s+'
    s.offset = 0
    r.sampler = s
    r.save!
  end

  def down
    @name = 'Julia'

    r = Repository.where(:name => @name).first
    r.destroy
  end
end

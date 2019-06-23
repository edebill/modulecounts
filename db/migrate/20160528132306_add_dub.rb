class AddDub < ActiveRecord::Migration[5.0]
  def up
    @name = 'DUB (dlang)'
    @url = 'https://code.dlang.org'
    r = Repository.new(:name => @name, :url => @url)
    s = RegexSampler.new
    s.data_url = @url
    s.regex = '<p>Found (\d+) packages.<\/p>'
    s.offset = 0
    r.sampler = s
    r.save!
  end

  def down
    @name = 'DUB (dlang)'

    r = Repository.where(:name => @name).first
    r.destroy
  end
end

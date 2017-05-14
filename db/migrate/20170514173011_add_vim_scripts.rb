class AddVimScripts < ActiveRecord::Migration[5.0]
  def up
    @name = 'Vim Scripts'
    @url = 'http://www.vim.org/scripts'
    r = Repository.new(:name => @name, :url => @url)
    s = RegexSampler.new
    s.data_url = 'https://vim.sourceforge.io/scripts/'
s.regex = 'Displaying \d+ of\s+([0-9,]+)<'
    s.offset = 0
    r.sampler = s
    r.save!
  end

  def down
    @name = 'Vim Scripts'

    r = Repository.where(:name => @name).first
    r.destroy
  end
end

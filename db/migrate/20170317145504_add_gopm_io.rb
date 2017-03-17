class AddGopmIo < ActiveRecord::Migration[5.0]
  def up
    @name = 'Gopm (go)'
    @url = 'https://gopm.io/'
    r = Repository.new(:name => @name, :url => @url)
    s = RegexSampler.new
    s.data_url = @url
    s.regex = 'Statistic.*Packages.*>([,\d]+)<.*PACKAGES'
    s.offset = 0
    r.sampler = s
    r.save!
  end

  def down
    @name = 'Gopm (go)'

    r = Repository.where(:name => @name).first
    r.destroy
  end

end

class AddDartRepository < ActiveRecord::Migration

  def up
    @repo_name = "Dart"
    @url = "https://pub.dartlang.org/packages"
    @data_url = "https://www.kimonolabs.com/api/8mjgyceu?apikey=5YBvcrTB43XXYfhpnXPneBlxTg2lpH4p"
    
    r = Repository.new(:name => @repo_name, :url => @url)
    s = JsonSampler.new(:data_url => @data_url, 
                        :key => "count",
                        :offset => 0)
    r.sampler = s
    r.save!

  end

  def down
    r = Repository.where(:name => "Dart").first
    r.destroy
  end
end

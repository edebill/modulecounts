class LoadRegexSamplers < ActiveRecord::Migration
  def up
    Repository.find_each do |r|
      next if r.sampler
      s = RegexSampler.new
      s.regex = r.regex
      s.data_url = r.url
      r.sampler = s
      r.save!
    end
  end

  def down
    # nothing to be done
  end
end

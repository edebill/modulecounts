class LoadRegexSamplers < ActiveRecord::Migration
  def self.up
    Repository.find_each do |r|
      next if r.sampler
      s = RegexSampler.new
      s.regex = r.regex
      s.data_url = r.url
      begin
        r.sampler = s
        r.save!
      rescue Exception => e
        puts e.inspect
        puts r.inspect
        puts r.errors.inspect
        puts s.inspect
        puts s.errors.inspect
        raise e
      end
    end
  end

  def self.down
    # nothing to be done
  end
end

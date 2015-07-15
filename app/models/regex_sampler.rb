class RegexSampler < Sampler

  def regex
    self.config(:regex)
  end

  def regex=(rx)
    self.set_config(:regex,rx)
  end

  def sample
    response = HTTParty.get(self.data_url)

    if md = response.body.match(self.regex)
      count = md[1].gsub(/&#\d+;/, "").gsub(/\D/, "").to_i
    else
      fail "RegexSampler didn't find count (sampler #{self.id}, #{self.repository.name})"
    end

    if self.config(:offset)
      count = count.to_i + self.config(:offset)
    end

    count
  end
end

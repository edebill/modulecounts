class RegexSampler < Sampler

  def regex
    self.config(:regex)
  end

  def regex=(rx)
    self.set_config(:regex,rx)
  end

  def sample
    response = HTTParty.get(self.data_url)

    begin
      count = extract(response.body, self.regex)
    rescue ArgumentError
      count = extract(response.body.force_encoding("ISO-8859-1"), self.regex)
    end

    if self.config(:offset)
      count = count.to_i + self.config(:offset)
    end

    count
  end

  def extract(body, regexp)
    if md = Regexp.new(regexp, Regexp::MULTILINE).match(body)
      md[1].gsub(/&#\d+;/, "").gsub(/\D/, "").to_i
    else
      fail "RegexSampler didn't find count (sampler #{self.id}, #{self.repository.name})"
    end
  end
end

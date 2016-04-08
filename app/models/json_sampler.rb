class JsonSampler < Sampler
  def key
    self.config(:key)
  end

  def key=(k)
    self.set_config(:key,k)
  end

  def sample
    response = HTTParty.get(self.data_url)

    count = JSON.parse(response.body)[self.key].to_s.gsub(/[, ]/, "").to_i

    if self.config(:offset)
      count = count.to_i + self.config(:offset)
    end

    count
  end
end

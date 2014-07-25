class JsonPathSampler < Sampler
  def path
    self.config(:path)
  end

  def path=(p)
    self.set_config(:path,p)
  end

  def sample
    response = HTTParty.get(self.data_url)

    json_path = JsonPath.new(self.path)

    count = json_path.on(response.body).first.to_i

    if self.config(:offset)
      count = count.to_i + self.config(:offset)
    end

    count
  end
end

class JsonArrayLengthSampler < Sampler
  def sample
    response = HTTParty.get(self.data_url)

    count = JSON.parse(response.body).length

    if self.config(:offset)
      count = count.to_i + self.config(:offset)
    end

    count
  end
end

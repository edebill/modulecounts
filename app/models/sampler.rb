class Sampler < ActiveRecord::Base
  validates_presence_of :repository_id, :type, :data_url
  
  belongs_to :repository

  before_save :serialize_configuration

  attr_accessor :configuration

  def sample
    raise "you need to subclass and implement this"
  end

  def config(key)
    ensure_configured

    @config[key.to_s]
  end

  def set_config(key, value)
    ensure_configured

    @config[key.to_s] = value
  end


  def offset
    self.config(:offset)
  end

  def offset=(k)
    self.set_config(:offset, k)
  end


  def ensure_configured
    @configured || parse_sampler_configuration
  end

  def parse_sampler_configuration
    if self.configuration_json
      @config = JSON.parse(self.configuration_json)
    else
      @config = {}
    end
    @configured = true
  end

  def serialize_configuration
    self.configuration_json = @config.to_json if @config
  end
end

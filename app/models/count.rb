class Count < ActiveRecord::Base
  belongs_to :repository

  validates_presence_of :repository_id, :record_date


  validates_numericality_of :value, :integer => true

  def self.earliest
    Count.order("record_date asc").limit(1).first
   end
end

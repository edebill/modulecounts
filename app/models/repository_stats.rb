class RepositoryStats < ActiveRecord::Base
  belongs_to :repository

  validates_numericality_of :repository_id, :integer => true
  validates_numericality_of :total, :integer => true
  validates_numericality_of :modules_day, :integer => true

end

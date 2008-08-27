class Space < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :key
  validates_uniqueness_of :key
  has_many :pages
  
  def to_param
    key
  end
end

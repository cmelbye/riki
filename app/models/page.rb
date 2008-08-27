class Page < ActiveRecord::Base
  belongs_to :space, :counter_cache => true
  belongs_to :user, :counter_cache => true
  has_many :revisions
  after_save :create_revision
  
  def to_param
    title
  end

  private
  
  def create_revision
    Revision.create!(attributes)
  end
end

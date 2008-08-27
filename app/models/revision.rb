class Revision < ActiveRecord::Base
  belongs_to :page
  belongs_to :space
  belongs_to :user
end

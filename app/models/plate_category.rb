class PlateCategory < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name

  validates :name, presence: true
  validates :user_id, presence: true
end

class Category < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :slots
  has_many :exchanges, through: :slots

  validates_presence_of :user
  validates :name, presence: true, length: { maximum: 30 }
  validates :icon, presence: true, length: { maximum: 20 }
end

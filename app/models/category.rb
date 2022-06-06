class Category < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :slots
  has_many :exchanges, through: :slots
end

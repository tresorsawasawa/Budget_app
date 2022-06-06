class Exchange < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :slots
  has_many :categories, through: :slots
end

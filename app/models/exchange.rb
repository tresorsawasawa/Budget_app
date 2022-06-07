class Exchange < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :slots
  has_many :categories, through: :slots

  validates_presence_of :name, :amount, :author
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :categories
  has_many :exchanges, foreign_key: 'author_id'

  validates :name, presence: true, length: { maximum: 50 }
end

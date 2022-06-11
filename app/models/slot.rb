class Slot < ApplicationRecord
  belongs_to :category
  belongs_to :exchange
end

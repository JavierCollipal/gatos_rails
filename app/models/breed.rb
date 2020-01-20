class Breed < ApplicationRecord
  has_one :cat
  validates :name, presence: true, uniqueness: true, length: 50
end

class Color < ApplicationRecord
  has_one :cat
  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 50}
end

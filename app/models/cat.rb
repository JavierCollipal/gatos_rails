class Cat < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4, maximum: 200}, uniqueness: true
  validates :page, presence: true, length: { in: 0...20}
end

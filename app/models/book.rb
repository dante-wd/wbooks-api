class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :year, presence: true
  validates :genre, presence: true
  validates :publisher, presence: true
  validates :image, presence: true
end

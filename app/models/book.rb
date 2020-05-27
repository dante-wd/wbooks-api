# frozen_string_literal: true

class Book < ApplicationRecord
  has_one :rent, dependent: destroy

  validates :title, presence: true
  validates :author, presence: true
  validates :year, presence: true
  validates :genre, presence: true
  validates :publisher, presence: true
  validates :image, presence: true
end

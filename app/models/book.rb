# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :rents, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true
  validates :year, presence: true
  validates :genre, presence: true
  validates :publisher, presence: true
  validates :image, presence: true

  def available?
    opt = { serializer: Api::V1::BookSerializer }
    book = ActiveModelSerializers::SerializableResource.new(self, opt).as_json
    book[:available]
  end
end

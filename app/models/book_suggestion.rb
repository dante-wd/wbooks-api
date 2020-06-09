class BookSuggestion < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :author, presence: true
  validates :link, presence: true
end

class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :from,
  			presence: true,
  			date: { before_or_equal_to: :to }
  validates :to,
  			presence: true,
  			date: { after_or_equal_to: :from }
  validates :user_id, presence: true
  validates :book_id, presence: true
end

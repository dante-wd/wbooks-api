module Api
  module V1
    class RentSerializer < ApplicationSerializer
      attributes :id,
                 :user_id,
                 :book_id,
                 :from,
                 :to
      belongs_to :user
      belongs_to :book
    end
  end
end

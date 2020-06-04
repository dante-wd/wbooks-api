module Api
  module V1
    class RentSerializer < ApplicationSerializer
      attributes :id,
                 :user_id,
                 :book_id,
                 :from,
                 :to,
                 :user,
                 :book
      def book
        BookSerializer.new(object.book)
      end

      delegate :user, to: :object
    end
  end
end

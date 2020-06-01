module Api
  module V1
    class BookSerializer < ApplicationSerializer
      attributes :id,
                 :title,
                 :author,
                 :genre,
                 :publisher,
                 :year,
                 :available
      attribute :image, key: :image_url

      def available
        available = if object.rent
                      false
                    else
                      true
                    end
        available
      end
    end
  end
end

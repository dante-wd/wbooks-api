module Api
  module V1
    class BookSerializer < ActiveModel::Serializer
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

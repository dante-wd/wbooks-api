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
        if object.rent
          available = false
        else
          available = true
        end
        return available
      end
    end
  end
end
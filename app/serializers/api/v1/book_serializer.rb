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
        if object.rent
          available = object.rent[:to] <= Time.zone.today
        else
          available = true
        end
        available
      end
    end
  end
end

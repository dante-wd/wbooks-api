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
        rent = object.rents.where(to: object.rents.select('MAX(rents.to)')).first
        rent ? (rent[:to] <= Time.zone.today) : true
      end
    end
  end
end

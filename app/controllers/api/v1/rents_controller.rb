module Api
  module V1
    class RentsController < ApplicationController
      before_action :authenticate_user!
      respond_to :json

      def index
        page_size = params[:page_size]
        page = [params[:page].to_i, Rent.page(1).per(page_size).total_pages].min
        rents = Rent.where(user_id: current_user.id).page(page).per(page_size)
        render json: rents, each_serializer: Api::V1::RentSerializer
      end

      def create
        rent = Rent.new(rent_params)
        rent.user_id = current_user.id
        book = Book.find(rent_params[:book_id]) rescue nil
        if !book
          render json: {error: "Libro no encontrado"}, status:404
          return
        end
        if book.available?
          rent.book_id = book.id
        else
          render json: {error: "Libro no disponible"}, status:422
          return
        end
        if rent.save
          render json: rent, serializer: Api::V1::RentSerializer
          return
        else
          render json: rent.errors
        end
      end

      def rent_params
        params.require(:rent).permit(:book_id, :from, :to)
      end
    end
  end
end

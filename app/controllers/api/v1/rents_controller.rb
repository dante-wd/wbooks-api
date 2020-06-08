module Api
  module V1
    class RentsController < ApiController
      before_action :authenticate_user!
      before_action :check_book_availability, only: [:create]
      before_action :clean_pagination
      respond_to :json

      def index
        rents = Rent.where(user_id: current_user.id).page(@page).per(@page_size)
        render json: rents, each_serializer: Api::V1::RentSerializer
      end

      def create
        rent = Rent.new(rent_params) do |r|
          r.user_id = current_user.id
        end
        render json: rent.errors and return unless rent.save

        render json: rent, serializer: Api::V1::RentSerializer and return
      end

      def check_book_availability
        book = Book.find_by(id: rent_params[:book_id])
        rent_error(book) and return if !book || !book.available?
      end

      def rent_error(rent)
        if !rent
          render json: { error: t(:book_not_found) }, status: :not_found
        elsif !rent.available?
          render json: { error: t(:book_not_available) }, status: :unprocessable_entity
        end
      end

      def rent_params
        params.require(:rent).permit(:book_id, :from, :to)
      end

      def page_params
        params.permit(:page, :page_size)
      end

      def clean_pagination
        @page_size = page_params[:page_size]
        @page = [page_params[:page].to_i, Rent.page(1).per(@page_size).total_pages].min
      end
    end
  end
end

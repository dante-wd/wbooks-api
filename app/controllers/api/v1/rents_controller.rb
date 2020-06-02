module Api
  module V1
    class RentsController < ApplicationController
      before_action :authenticate_user!
      respond_to :json
      def index
        page_size = params[:page_size]
        page = [params[:page].to_i, Rent.page(1).per(page_size).total_pages].min
        rents = Rent.page(page).per(page_size)
        render json: rents, each_serializer: Api::V1::RentSerializer
      end

      def create
        # puts 'imprimiendo parametros'
        # params.each do |key, val|
        #  puts key.to_s + ': ' + val.to_s
        # end
        # puts 'parametros impresos'
        # puts 'imprimiendo datos de sesion'
        # session.each do |key, val|
        #  puts key.to_s + ': ' + val.to_s
        # end
        # puts 'datos de sesion impresos'
        rent = Rent.new(params[:user])
        if rent.save
          render json: rent, serializer: Api::V1::RentSerializer
        else
          render 'Error?'
        end
      end
    end
  end
end

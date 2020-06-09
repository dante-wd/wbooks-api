module Api
  module V1
    module Books
      class OpenLibraryController < ApiController
        respond_to :json

        def index
          book = async_request(OpenLibraryService,params[:bibkeys])
          render json: book
        end
      end
    end
  end
end
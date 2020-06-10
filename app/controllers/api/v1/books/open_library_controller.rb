module Api
  module V1
    module Books
      class OpenLibraryController < ApiController
        # include AsyncRequest::ApplicationHelper
        respond_to :json

        def book_info
          book = OpenLibraryService.call(params[:bibkeys])
          render json: book, status: :not_found unless book
          render json: book, status: :ok
        end
      end
    end
  end
end

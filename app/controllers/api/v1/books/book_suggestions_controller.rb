module Api
  module V1
    module Books
      class BookSuggestionsController < ApiController
        respond_to :json

        def index
          sugs = BookSuggestion.all
          render json: sugs
        end

        def create
          sug = BookSuggestion.new(sug_params) do |r|
            r.user_id = current_user.id
          end
          unless sug.save
            render json: { error: sug.errors }, status: :unprocessable_entity and return
          end

          render json: sug, status: :created and return
        end

        def sug_params
          params.require(:book_suggestion).permit!
        end
      end
    end
  end
end

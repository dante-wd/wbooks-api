module Api
  module V1
    class BooksController < ApplicationController
      def index
        page_size = params[:page_size]
        page = [params[:page].to_i, Book.page(1).per(page_size).total_pages].min
        books = Book.page(page).per(page_size)
        render json: books
      end

      def show
        book = Book.find(params[:id])
        render json: book
      end
    end
  end
end

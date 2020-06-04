require 'rails_helper'

describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all books' do
      subject(:books) { create_list(:book, 10) }
      
      before do
        subject
        get :index
      end

      it 'responds with the books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: Api::V1::BookSerializer, serializer: Api::V1::BookSerializer
        ).to_json
        puts books
        expect(response_body.to_json).to eq expected
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When fetching a book' do
      subject(:book) { create(:book) }

      before do
        get :show, params: { id: book.id }
      end

      it 'responds with the book json' do
        expect(response_body.to_json).to eq Api::V1::BookSerializer.new(
          book, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
  def response_body
    JSON.parse(response.body)
  end
end
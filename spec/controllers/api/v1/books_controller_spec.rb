require 'rails_helper'

describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all books' do
      subject(:books) { create_list(:book, 10) }

      before do
        get :index
      end

      it 'responds with the books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: Api::V1::BookSerializer, serializer: ActiveModel::Serializer::CollectionSerializer
        ).to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
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
        expect(response.body.to_json).to eq Api::V1::BookSerializer.new(
          book, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
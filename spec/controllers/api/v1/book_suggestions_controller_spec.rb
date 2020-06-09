require 'rails_helper'

describe Api::V1::Books::BookSuggestionsController, type: :controller do
  include_context 'Authenticated User'
  describe 'POST #create' do
    context 'When creating a valid suggestion' do
      let!(:new_sug_attributes) { build(:book_suggestion, user: user) }
      it 'creates a new suggestion' do
        expect do
          params = { book_suggestion: new_sug_attributes }
          post :create, params: params, as: :json
        end.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        post :create, params: { id: user.id, book_suggestion: new_sug_attributes }, as: :json
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating an invalid suggestion' do
      let!(:new_sug_attributes) { build(:book_suggestion, title: nil) }
      before do
        post :create, params: { id: user.id, book_suggestion: new_sug_attributes }, as: :json
      end

      it 'doesn\'t create a new rent' do
        expect do
          post :create, params: { id: user.id, book_suggestion: new_sug_attributes }, as: :json
        end.to change { BookSuggestion.count }.by(0)
      end

      it 'returns error messages' do
        expect(response_body['error']).to be_present
      end

      it 'responds with 422 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
  def response_body
    JSON.parse(response.body)
  end
end
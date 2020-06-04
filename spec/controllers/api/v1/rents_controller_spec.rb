require 'rails_helper'

describe Api::V1::RentsController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all rents' do

      subject(:books) do
        create_list(:book, 5)
      end

      subject(:rents) do
        create_list(:rent, 10, user_id: user.id)
      end
      
      before do
        subject
        get :index
      end

      it 'responds with the rents owned by the user' do
        expected = ActiveModelSerializers::SerializableResource.new(rents,{each_serializer: Api::V1::RentSerializer}).as_json.to_json
        expect(response_body.to_json).to eq expected
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST #create' do
    context 'When creating a rent' do
      subject(:book) do
        create(:book)
      end
      subject(:rent) do
        build(:rent, user_id: nil, book_id: book.id)
      end

      before do
        subject
        params = {rent: rent}
        post :create, params: params, as: :json
      end

      it {expect(response_body).to include("id" => (a_value > 0))}
      it {expect(response_body).to include("user_id" => (user.id))}
      it {expect(response_body).to include("book_id" => (book.id))}

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
  def response_body
    JSON.parse(response.body)
  end
end
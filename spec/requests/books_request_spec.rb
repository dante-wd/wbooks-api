require 'rails_helper'

RSpec.describe "Book requests", type: :request do
  describe "#show" do
    it "shows Books" do
      headers = { "ACCEPT" => "application/json",
                  "Authorization" => "JWT"
                }
      get "/api/v1/books", :headers => headers

      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:ok)
    end
  end
  describe "#index" do
    context "when no parameters are specified" do
      it "shows all Books" do
        headers = { "ACCEPT" => "application/json",
                    "Authorization" => "JWT"
                  }
        get "api/v1/books"

      end
    end
  end
end

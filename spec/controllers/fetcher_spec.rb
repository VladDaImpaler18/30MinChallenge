require 'rails_helper'

describe FetchersController, :type => :controller do
    before(:each) do
        get "index"
    end
    context "GET fetchers#index" do
        it "returns a 200 OK status" do
            expect(response).to have_http_status(:ok)
        end
        it "returns json" do
            expect(response.content_type).to eq("application/json; charset=utf-8")
        end
    end
end
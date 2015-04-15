require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #index" do
  	it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end

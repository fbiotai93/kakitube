require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
	login_admin

  describe "GET #index" do
  	it "should have an admin permission" do
      expect(subject.current_user).not_to be_nil
      expect(subject.current_user.admin).to be_truthy
    end
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end

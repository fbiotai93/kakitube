require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  login_admin

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should load all posts" do
      get :index
    end
  end

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates the post' do
        post :create, FactoryGirl.attributes_for(:post, user: @user)
        expect(Post.count).to eq(1)
      end
      it 'redirects to the "index" page after create' do
        post :create, FactoryGirl.attributes_for(:post, user: @user)
        expect(response).to redirect_to posts_path
      end
    end

    # context 'with invalid attributes' do
    #   it 'does not create the post' do
    #     post :create, FactoryGirl.attributes_for(:post, embed: nil, user: @user)
    #     expect(Post.count).to eq(0)
    #   end
    #   it 're-renders the "new" view' do
    #     post :create, FactoryGirl.attributes_for(:post, embed: nil, user: @user)
    #     expect(response).to render_template :new
    #   end
    # end
  end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end

require 'rails_helper'

RSpec.describe WikisController, type: :controller do

  #user = User.create!(email: "user@example.org", password: "very-secret")
  user = User.new
  user.email = "user@example.org"
  user.password = "very-secret"
  wiki = Wiki.create!(title: "First Wiki Topic", body: "This is the body of the topic", private: false, user_id: user.id)


  describe "GET #index" do
    it "returns http success" do
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
      sign_out user
    end
  end

  describe "GET #show" do
    it "returns http success" do
      sign_in user
      get :show, id: wiki.id
      expect(response).to have_http_status(:success)
      sign_out user
    end
  end
  #
  describe "GET #new" do


    it "returns http success" do
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
      sign_out user
    end

    it "expects to extaniate a new wiki" do
      sign_in user
      get :new
      expect(assigns(:wiki)).not_to be nil
      sign_out user
    end


  end

  describe "POST create" do
    it "increases the number of posts to 1" do
      sign_in user
      post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false, user_id: user.id}
      expect(response).to redirect_to(wikis_path)
      sign_out user
    end
    it "assigns the new wiki to @wiki" do
      sign_in user
      # post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false, user_id: user.id}
      # expect(assigns(:wiki)).to eq Wiki.last
      sign_out user
    end
    it "redirects to the new wiki if saved successfully" do

    end
  end


  describe "GET #edit" do
    it "returns http success" do
      sign_in user
      get :edit, id: wiki.id
      expect(response).to have_http_status(:success)
      sign_out user
    end
  end


end

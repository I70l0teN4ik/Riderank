require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http status not_acceptable" do
      post :create, params: { user: {:email => 'foo@bar.com', :password => '' } }

      expect(response).to have_http_status(:not_acceptable)
    end
  end
end

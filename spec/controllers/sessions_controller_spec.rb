require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http status unauthorized" do
      post :create, params: { session: {:email => 'foo@bar.com', :password => '' } }

      expect(response).to have_http_status(:unauthorized)
      end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      delete :destroy
      expect(response).to have_http_status(:redirect)
    end
  end

end

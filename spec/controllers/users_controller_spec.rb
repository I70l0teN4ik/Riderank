require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  xdescribe "POST #create" do
    it "returns http success" do
      post :create, params: { user: {:username => 'foo', :password =>'bar'} }

      expect(response).to render_template(:new)
    end
  end

end

require 'rails_helper'

RSpec.describe RidesController, type: :controller do

  describe "GET #new" do
    it "must be redirected for empty session" do
      get :new
      expect(response).to have_http_status(:redirect)
    end

    it "must be success after login" do
      log_in

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    before do
      log_in
    end

    it "returns http status not_acceptable" do
      post :create, params: { ride: {:origin => 'Mazowiecka 3/5, Warszawa',
                                     :destination => 'plac Europejski 2, Warszawa' } }

      expect(response).to have_http_status(:not_acceptable)
    end
  end

end

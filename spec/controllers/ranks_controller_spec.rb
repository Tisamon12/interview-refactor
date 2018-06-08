require 'rails_helper'

RSpec.describe RanksController, :type => :controller do
  let!(:tv_show) { TvShow.create!(title: SecureRandom.hex) }

  before do
    user = User.create!(email: 'foo@example.com', password: '12345678')
    sign_in :user, user
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index, tv_show_id: tv_show.id, :format => :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    let(:params) { { value: 7 } }

    it "responds successfully with an HTTP 200 status code" do
      request.accept = "application/json"
      post :create, tv_show_id: tv_show.id, rank: params

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT #update" do
    let(:rank) { Rank.create!(value: 5, tv_show_id: tv_show.id) }
    let(:params) { { value: 6 } }

    it "responds successfully with an HTTP 200 status code" do
      request.accept = "application/json"
      put :update, id: rank.id, tv_show_id: tv_show.id, rank: params

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end

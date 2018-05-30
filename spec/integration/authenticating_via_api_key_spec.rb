require 'rails_helper'

describe "Authenticating via api key", :type => :request do
    let(:user) {User.create!(email: 'foo@example.com', password: '12345678')}

    it "GET #index responds successfully with an HTTP 200 status code" do
        get "/", api_key: user.api_key, format: :json
        expect(response).to be_success
        expect(response).to have_http_status(200)
    end
end
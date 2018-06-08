require 'rails_helper'

describe "Updating tv show rank", :type => :request do
  it "Update tv show rank to average of all ranks" do
    user1, user2 = User.create!(email: "foo1@example.com", password: "12345678"), User.create!(email: "foo2@example.com", password: "123456789")
    tv_show = TvShow.create!(title: SecureRandom.hex, user_id: user1.id)
    #request.accept = "application/json"
    Rank.create!(user_id: user1.id, tv_show_id: tv_show.id, value: 4)
    Rank.create!(user_id: user2.id, tv_show_id: tv_show.id, value: 6)
    tv_show = TvShow.first
    expect(tv_show.rank).to eq 5
    #expect(response).to have_http_status(200)
  end
end
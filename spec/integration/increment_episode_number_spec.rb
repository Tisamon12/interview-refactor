require 'rails_helper'

RSpec.describe "Increment episode number", :type => :request do
    it "increment episode number when creating an episode" do
        user = User.create!(email: 'foo@example.com', password: '12345678')
        tv_show = TvShow.create!(user_id: user.id, title: 'SOA')
        ep1 = Episode.create!(episode: 1, tv_show_id: tv_show.id, watched: false, title: SecureRandom.hex)
        ep2 = Episode.create!(episode: 2, tv_show_id: tv_show.id, watched: false, title: SecureRandom.hex)
        expect(ep1.episode).to eq 1
        expect(ep2.episode).to eq 2
    end
end
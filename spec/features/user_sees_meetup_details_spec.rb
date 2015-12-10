require 'spec_helper'

feature "user sees meetup details" do

  let(:soccer) { Meetup.create(name: "Soccer Game", description: "kick the round thing", location: "iah's house", creator: pamalamadingdong) }

  let (:pamalamadingdong) { User.create(provider: "provider1", uid: "2", username: "Pamalamadingdong", email: "pama@lama.com", avatar_url: "www.stuff.com")}

  let (:soccerpeeps) { Membership.create(user: pamalamadingdong, meetup: soccer) }

  scenario "meetups on index page link to meetup show page" do
    soccer.save
    pamalamadingdong.save
    soccerpeeps.save

    visit '/meetups'
    click_link 'Soccer Game'
    expect(page).to have_content "Soccer Game"
    expect(page).to have_content "kick the round thing"
    expect(page).to have_content "iah's house"
    expect(page).to have_content "Pamalamadingdong"
  end

end

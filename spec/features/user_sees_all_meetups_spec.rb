require 'spec_helper'

feature "user sees meetups" do

  let (:pamalamadingdong) { User.create(provider: "provider1", uid: "2", username: "Pamalamadingdong", email: "pama@lama.com", avatar_url: "www.stuff.com")}

  let(:soccer) { Meetup.create(name: "Soccer Game", description: "kick the round thing", location: "iah's house", creator: pamalamadingdong) }

  let (:launchparty) { Meetup.create(name: "Launch Party", description: "it is a party", location: "Mission Control", creator: pamalamadingdong) }

  scenario "all meetups listed" do
    soccer.save
    launchparty.save

    visit '/meetups'
    expect(page).to have_content "Soccer Game"
    expect(page).to have_content "Launch Party"
  end

  scenario "meetups listed alphabetically" do
    soccer.save
    launchparty.save

    visit '/'
    soccer_position = page.body.index("Soccer Game")
    launchparty_position = page.body.index("Launch Party")

    expect(launchparty_position).to be < soccer_position
  end

end

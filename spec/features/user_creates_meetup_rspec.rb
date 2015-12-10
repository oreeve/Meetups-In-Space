require 'spec_helper'

feature "user creates meetup" do

  scenario "there is a link on index that takes you to a page to create meetup" do

    visit '/'
    click_link("Create New Meetup!")
    expect(page).to have_content("Create Meetup")
    expect(page).to have_content("Name")
    expect(page).to have_content("Location")
    expect(page).to have_content("Description")
  end

  # scenario "user is not signed in" do
  #   visit '/new'
  #   click_button 'Submit'
  #   # expect(page).to have_content("Please sign in!")
  # end
  # #
  # # scenario "user is signed in and attempts to submit empty form" do
  # #   visit '/'
  # #   click_link 'Sign In'
  # #   visit '/new'
  # #   click_button 'Submit'
  # #   expect(page).to have_content("Please fill out all forms!")
  #
  # end

end
# fill_in "Name", with: 'Soccer Game'

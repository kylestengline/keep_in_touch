require 'rails_helper'
require 'database_cleaner'

RSpec.feature "Users can Sign Up" do

  scenario "A user can visit the homepage and sign up" do
    visit "/"

    click_link "Sign Up"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")
  #Had to go into layout/application.html.erb to get this to pass and add flash.each do method
  end

end

require 'rails_helper'

RSpec.feature "Signing Users In" do

  before do 
    @joe = User.create!(email: 'joe@example.com', password: "rickshaw")
  end

  scenario "A valid user can Sign In" do
    visit "/"

    click_link "Sign In"
    fill_in "Email", with: @joe.email
    fill_in "Password", with: @joe.password
    click_button "Log in"

    expect(page).to have_content("Welcome, #{@joe.email}!")
    expect(page).to have_link "My Profile"
    expect(page).to have_link "Sign Out"
  end
end

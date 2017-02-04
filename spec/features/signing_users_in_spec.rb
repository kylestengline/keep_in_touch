require 'rails_helper'

RSpec.feature "Signing Users In" do

  let(:user) {User.create!(email: 'joe@example.com', password: "rickshaw")}

  scenario "A valid user can Sign In" do
    visit "/"

    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content("Welcome, #{user.email}!")
    expect(page).to have_link "My Profile"
    expect(page).to have_link "Sign Out"
  end
end

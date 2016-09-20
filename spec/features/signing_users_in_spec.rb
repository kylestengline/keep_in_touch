require 'rails_helper'

RSpec.feature "Signing Users In" do

  before do 
    @joe = User.create!(email: 'joe@example.com', first_name: "Joe", password: "rickshaw")
  end

  scenario "A valid user can Sign In" do
    visit "/"

    click_link "Sign In"
    fill_in "First name", with: @joe.first_name
    fill_in "Email", with: @joe.email
    fill_in "Password", with: @joe.password
    click_button "Log in"

    expect(page).to have_content("Welcome, #{@joe.first_name}!")
  end
end

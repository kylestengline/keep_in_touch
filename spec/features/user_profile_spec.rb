require 'rails_helper'

RSpec.feature 'User Profile' do

    let(:user) {User.create(email: "joe@example.com", password: 'rickshaw')}

  scenario 'A logged in valid user can creates contacts' do
    login_as(user)
    
    visit "/"

    click_link "My Profile"

    expect(page).to have_content("Welcome #{user.email}")
    expect(current_path).to eq(profiles_path)
    expect(page).to have_link("My Contacts")
    expect(page).to have_link("Add New Contact")

  end
end

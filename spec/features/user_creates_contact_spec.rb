require 'rails_helper'

RSpec.feature 'User Profile' do

  let(:user) {User.create(email: "joe@example.com", password: 'rickshaw')}

  scenario 'A logged in valid user can create contacts' do
    login_as(user)
    
    visit "/profiles"

    click_link "Add New Contact"

    fill_in "First name", with: "Jill"
    fill_in "Last name", with: "Greenberg"
    fill_in "Phone number", with: 1234567891
    fill_in "Message", with: "This is my message to you"

    click_button "Add Contact"

    expect(current_path).to eq(contacts_path)
    expect(page).to have_content("Contact created Successfully")

  end
end

require 'rails_helper'

RSpec.feature 'User Profile' do

  before do 
    @joe = User.create(email: "joe@example.com", password: 'rickshaw')
    login_as(@joe)
  end

  scenario 'A logged in valid user can create contacts' do
    
    visit "/profiles"

    click_link "Add New Contact"

    fill_in "First Name", with: "First"
    fill_in "Last Name", with: "Last"
    fill_in "Phone Number", with: 1234567891

    click_button "Add Contact"

    expect(current_path).to eq(profiles_path)
    expect(page).to have_content("Contact created Successfully")

  end
end

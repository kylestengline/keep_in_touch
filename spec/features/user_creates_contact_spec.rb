require 'rails_helper'

RSpec.feature 'User Profile' do

  before do 
    @joe = User.create(email: "joe@example.com", password: 'rickshaw')
    login_as(@joe)

    @contact = Contact.create(first_name: 'Jeff', last_name: "Henry", created_at: "Time.now")
  end

  scenario 'A logged in valid user can create contacts' do
    
    visit "/"

    click_link "My Profile"
    click_link "Add New Contact"

    fill_in "First Name", with: "First"
    fill_in "Last Name", with: "Last"
    fill_in "Number", with: 1

    expect(page).to have_content("Contact created Successfully")
    expect(current_path).to eq(profile_path)
    expect(page).to have_content("Contact Created: #{@contact.created_at}")

  end
end

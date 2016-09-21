require 'rails_helper'

RSpec.feature 'User Profile' do

  before do 
    @joe = User.create(email: "joe@example.com", password: 'rickshaw')
    login_as(@joe)
  end

  scenario 'A logged in valid user can creates a contacts' do
    
    visit "/"

    click_link "My Profile"

    expect(page).to have_content("Welcome #{@joe.email}")
    expect(current_path).to eq(profiles_path)
    expect(page).to have_link("Add New Contact")


  end
end

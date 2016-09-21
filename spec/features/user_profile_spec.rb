require 'rails_helper'

RSpec.feature 'User Profile' do

  before do 
    @joe = User.create(email: "joe@example.com", first_name: 'Joe', password: 'rickshaw')
    login_as(@joe)
  end

  scenario 'A logged in valid user can creates a contacts' do
    
    visit "/"

    click_link "My Profile"

    expect(page).to have_content("Welcome #{@joe.first_name}")
    expect(current_path).to eq(profiles_path)
    expect(page).to have_link("Add New Contact")


  end
end

require 'rails_helper'

RSpec.feature "Vist Homepage" do

  scenario "Users can vist the homepage and click sign in and sign out" do

    visit "/"

    expect(page).to have_link "Sign In"
    expect(page).to have_link "Sign Up"
    expect(current_path).to eq(root_path) 
  end
end

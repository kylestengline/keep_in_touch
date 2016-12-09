require 'rails_helper'

RSpec.feature "Visit Homepage" do

  scenario "Users can vist the homepage and click sign in and sign up" do

    visit "/"

    expect(page).to have_content "Keep In Touch Home Page"
    expect(page).to have_link "Sign In"
    expect(page).to have_link "Home"
    expect(page).to have_link "Sign Up"
    expect(current_path).to eq(root_path) 

  end
end

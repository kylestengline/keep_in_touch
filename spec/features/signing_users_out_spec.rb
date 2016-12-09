require 'rails_helper'
require 'database_cleaner'

RSpec.feature "Users can Sign Out" do
  before do 
    @joseph = User.create(email: 'js@me.com', password: 'password')

    visit root_path

    click_link "Sign In"
    fill_in "Email", with: @joseph.email
    fill_in "Password", with: @joseph.password
    click_button "Log in"
  end

 scenario "A signed in user can sign out" do
   visit root_path

   within("nav.mdl-navigation.mdl-layout--large-screen-only") do
     click_link "Sign Out"
   end

   expect(page).to have_content "Signed out successfully."
   expect(page).to have_link "Sign In"
   expect(page).to have_link "Home"
   expect(page).to have_link "Sign Up"
 end
end


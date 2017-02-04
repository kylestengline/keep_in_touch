require 'rails_helper'
require 'database_cleaner'

RSpec.feature "Users can Sign Out" do
  let(:user) {User.create(email: 'js@me.com', password: 'password')}


 scenario "A signed in user can sign out" do
   visit root_path

   click_link "Sign In"
   fill_in "Email", with: user.email
   fill_in "Password", with: user.password
   click_button "Log in"

   within("nav.mdl-navigation.mdl-layout--large-screen-only") do
     click_link "Sign Out"
   end

   expect(page).to have_content "Signed out successfully."
   expect(page).to have_link "Sign In"
   expect(page).to have_link "Home"
   expect(page).to have_link "Sign Up"
 end
end


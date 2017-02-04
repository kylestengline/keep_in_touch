require 'rails_helper'

RSpec.feature "Show Contacts" do
  
  let!(:user) {User.create(email: "joe@example.com", password: 'rickshaw')}
  
  let!(:contact) {Contact.create(first_name: "Jill", last_name: "Greenberg", phone_number: 1234567890, message: "My message to you", user: user)}

  scenario "A valid user can see their contacts" do
    login_as(user)
    
    visit "/contacts"
    
    expect(page).to have_content(contact.first_name)
    expect(page).to have_content(contact.last_name)

  end
end

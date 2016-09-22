require 'rails_helper'

RSpec.feature "Show Contacts" do
  
  before do 
    @joe = User.create(email: "joe@example.com", password: 'rickshaw')
    login_as(@joe)
    
    @contact = Contact.create(first_name: "Jill", last_name: "Greenberg", phone_number: 1234567890, message: "My message to you", user: @joe)
  end

  scenario "A valid user can see their contacts" do
    
    visit "/contacts"
    
    expect(page).to have_content(@contact.first_name)
    expect(page).to have_content(@contact.last_name)

  end
end

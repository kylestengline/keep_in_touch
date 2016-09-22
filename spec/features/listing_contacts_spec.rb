require 'rails_helper'

RSpec.feature "Show Contacts" do
  
  before do 
    @joe = User.create(email: "joe@example.com", password: 'rickshaw')
    login_as(@joe)
    
    @contact = Contact.create(first_name: "Jen", last_name: "Hogart", phone_number: 6192389981, user: @joe)
  end

  scenario "A valid user can see their contacts" do
    
    visit "/contacts"

    expect(page).to have_link(@contact.first_name)
    expect(page).to have_content(@contact.last_name)
    
  end
end

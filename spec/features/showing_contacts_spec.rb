require 'rails_helper'

RSpec.feature "Users sees individual contact" do

  before do
    joe = User.create(email: "joe@example.com", password: "rickshaw")
    login_as(joe)

    @contact = Contact.create(first_name: "Jill", last_name: "Greenberg", phone_number: 1234567890, message: "My message to you", user: joe)
  end
  
  scenario "A user views and sends texts to their contact" do

    visit contacts_path

    click_link(@contact.first_name) && click_link(@contact.last_name)

    expect(page).to have_content(@contact.first_name)
    expect(page).to have_content(@contact.last_name)
    expect(page).to have_content(@contact.phone_number)
    expect(page).to have_content(@contact.message)

    click_button "Send Message"

    expect(current_path).to eq(contact_path)
    expect(page).to have_content("Message Sent")

  end
end

require 'rails_helper'

RSpec.feature "Users sees individual contact" do

  let(:user) {User.create(email: "joe@example.com", password: "rickshaw")}

  let!(:contact) {Contact.create(first_name: "Jill", last_name: "Greenberg", phone_number: 1234567890, message: "My message to you", user: user)}
  
  scenario "A user views and sends texts to their contact" do
    login_as(user)

    visit contacts_path

    click_link(contact.first_name)

    expect(current_path).to eq(contact_path(contact))

    expect(page).to have_content(contact.first_name)
    expect(page).to have_content(contact.last_name)
    expect(page).to have_content(contact.phone_number)
    expect(page).to have_content(contact.message)

    click_button "Send Message"

    expect(page).to have_content("Message Sent")

  end
end

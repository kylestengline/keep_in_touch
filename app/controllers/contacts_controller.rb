class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    if @contact.save
      flash[:notice] = "Contact created Successfully"
      redirect_to profiles_path
    else
      flash[:notice] = "Contact not created!"
      render :new
    end
  end

    private

      def contact_params
        params.require(:contact)
        .permit(:first_name, :last_name, :phone_number)
      end
end

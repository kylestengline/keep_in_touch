class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contact.build(contact_params)
    if @contact.save
      flash[:notice] = "Contact created Successfully"
      redirect_to root_path
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

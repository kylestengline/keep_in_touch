class ContactsController < ApplicationController

  def index
    @contacts = current_user.contacts.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      flash[:notice] = "Contact created Successfully"
      redirect_to contacts_path
    else
      flash[:notice] = "Contact not created!"
      render :new
    end
  end

  def message
    @twilio_test = ENV['TWILIO_SID']
    @twilio_auth = ENV['TWILIO_AUTH_TOKEN']

#have to pay in order for this to work.
    @client = Twilio::REST::Client.new @twilio_test, @twilio_auth
      @client.account.messages.create({
        from: 5709061009,
        to: 5709061009,
        body: "MY Message to you",
      })
      #in production this should be 
      #from: twilio_number
      #to: contact_number and body stays as is.
#    end
    redirect_to :show

#    @number = YAML.load_file('config/phone_numbers.yml')
    #not sure I need this or not
#    @contact_number = Contact.find(params[id: :phone_number]) 
#    @contact_message = Contact.find(params[:id])

#    @number.each do |num|
  end

    private

      def contact_params
        params.require(:contact)
        .permit(:first_name, :last_name, :phone_number, :message)
      end


end

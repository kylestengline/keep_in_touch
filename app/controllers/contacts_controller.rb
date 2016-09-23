class ContactsController < ApplicationController
  @number = YAML.load_file('config/phone_numbers.yml')

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


    private

      def contact_params
        params.require(:contact)
        .permit(:first_name, :last_name, :phone_number, :message)
      end

      def send_message
        @twilio_test = ENV['TWILIO_SID']
        @client = Twilio::REST::Client.new ENV['TWILIO_TEST_TOKEN']

        @contact_number = Contact.find(params[:phone_number]) 
        @contact_message = Contact.find(params[:message])

        @number.each do |num|
          client.account.messages.create(
            from: num,
            to: num,
            body: @contact_message
          )
          #in production this should be 
          #from: twilio_number
          #to: contact_number and body stays as is.
        end
        redirect_to :show
      end

end

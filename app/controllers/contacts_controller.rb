class ContactsController < ApplicationController
  def create
    @contact = Contact.new contact_params

    if @contact.save
      @contact = Contact.new
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end

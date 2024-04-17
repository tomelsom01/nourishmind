class ContactController < ApplicationController
  def index
    @contact = Contact.new
  end

  def send_email
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.send_contact_email(@contact).deliver_now
      redirect_to root_path, notice: "Email sent successfully!"
    else
      flash.now[:alert] = "Failed to send email. Please check the form."
      render :index
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message, :nickname)
  end
end

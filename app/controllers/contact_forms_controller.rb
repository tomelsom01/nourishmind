class ContactFormsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    # Initialize a new instance of ContactForm
    @contact_form = ContactForm.new
  end

  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(contact_form_params)

    if @contact_form.valid? && @contact_form.deliver
      flash[:notice] = 'Thank you! Your message has been sent successfully.'
    else
      flash[:alert] = 'Oops! Something went wrong. Please check the form and try again.'
    end
    redirect_to contact_path
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :message)
  end
end

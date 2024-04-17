class ContactFormsController < ApplicationController
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
      redirect_to contact_path
    else
      flash[:alert] = 'Oops! Something went wrong. Please check the form and try again.'
      render :new
    end
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :message)
  end
end

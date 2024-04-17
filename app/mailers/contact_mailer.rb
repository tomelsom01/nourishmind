class ContactMailer < ApplicationMailer
  def send_contact_email(contact)
    @contact = contact
    mail(to: "te28@hotmail.com", subject: "New Contact Form Submission")
  end
end

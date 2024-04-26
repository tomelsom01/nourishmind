class Contact < MailForm::Base

  attribute :name, validate: true
  attribute :email, validate: /\A[^@\s]+@[^@\s]+\z/i
  attribute :message
  attribute :nickname, captcha: true

  def headers
    {
      subject: "Contact Form Inquiry",
      to: "te28@hotmail.com",
      from: %("#{name}" <#{email}>),
      
    }
  end
end

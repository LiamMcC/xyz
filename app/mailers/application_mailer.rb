class ApplicationMailer < ActionMailer::Base
  default from: 'me@liammccabe.ie'
  layout 'mailer'


  def general_message(contact)
    @contact = contact
    mail( :to => "admin@example.com", :subject => "You Have a Message From Your Website")
  end
end

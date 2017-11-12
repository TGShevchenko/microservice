require 'mail'

module Email
  class Mailer
    def initialize
      @mail_options = {
          :address              => 'smtp.gmail.com',
          :port                 => 587,
          :user_name            => 'testkisitask@gmail.com',
          :password             => 'kisi1234',
          :authentication       => 'plain',
          :enable_starttls_auto => true
      }
    end

    def send_email(mail_options)
      mail = Mail.new do
        to mail_options[:to] #'altarangen@gmail.com'
        from 'testkisktask@gmail.com'
        subject mail_options[:subject] #'Test'
        body mail_options[:body] #'Hurray!!! Test email!'
      end
      mail.delivery_method :smtp, @mail_options
      mail.deliver
    end

  end
end
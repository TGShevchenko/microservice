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

    ##
    # Sends an Email notification to a user.
    #
    # @param [Hash] mail_options
    def send_email(mail_options)
      mail = Mail.new do
        to mail_options[:to]
        from 'testkisktask@gmail.com'
        subject mail_options[:subject]
        body mail_options[:body]
      end
      mail.delivery_method :smtp, @mail_options
      mail.deliver
    end
  end
end
module Actions
  class SendEmailAction < BasicAction
    def run(rule)
      puts 'Sending an email...'
      mailer = Email::Mailer.new
      rule.subscribers.each do |subscriber|
        mail_options = {:to => subscriber,
                        :subject => 'Information to a user',
                        :body => @message}
        mailer.send_email(mail_options)
      end
    end
  end
end
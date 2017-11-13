# README

#### Ruby version
     2.4.1p111

#### Configuration
     The following steps should be done as prerequisites:
     1. Create a user at my.getkisi.com and all corresponding objects needed for an Event Webhook
     integration of this application into Kisi in order to receive events.
     
     2. Register the application using POST method to https://api.getkisi.com/integrations
     The callback URL is http://stripe.kisi.ultrahook.com/hooks.
     
#### How to run the test suite
     rspec spec/lib/apply_rule_spec.rb

#### Services (job queues, cache servers, search engines, etc.)
     In order to test the microservice in a development mode on localhost, the ultrahook gem could be installed:
     gem install ultrahook
  
     The following command should be used in a terminal in order to forward calls to localhost:
     ultrahook -k I9P1YKVlI8L4ljP9Qvj6cFOm7bMoBitT stripe  3000
  
#### Deployment instructions
     As long as the initial requirements do not include the deployment procedure, 
     the application can be used with the following command:
     RAILS_ENV=development bundle exec rails s
  
#### Classes used in the project
     WebhooksController - A controller class that receives the incoming requests with event data.
     RuleProcessor - A main class that created and applies the rules.
     RuleBuilder - Builds a rule and keeps it in its rules collection.
     Rule - A rule class.
     BasicRuleField - A basic class for rule fields.
     ActionRuleField,
     ObjectRuleField,
     SuccessRuleField,
     TimeRuleField,
     UserRuleField 
       - Classes, each of them represents one parameter (one rule field) that is being matched when the rule applied. 
    BasicAction - A basic class for actions.
    SendEmailAction - A specific action that runs and initiates email sending for subscribers when a rule maches. 
    Mailer - A class is responsible for sending emails.

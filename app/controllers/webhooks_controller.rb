require 'webhook'

##
# It receives Event Webhooks from the Kisi API and uses
# a dedicated Rules::RuleProcessor class in order to process
# the event data
#
class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receive
    if request.headers['Content-Type'] == 'application/json'
      data = JSON.parse(request.body.read)
    else
      # application/x-www-form-urlencoded
      data = params.as_json
    end
    head :no_content

    # The following lines create an instance of the class
    # that is responsible of
    # defining the rules and applying them.
    rule_processor = Rules::RuleProcessor.new
    rule_processor.apply_rules(data)
  end
end
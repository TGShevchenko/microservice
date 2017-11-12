require 'webhook'

class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receive
    if request.headers['Content-Type'] == 'application/json'
      data = JSON.parse(request.body.read)
    else
      # application/x-www-form-urlencoded
      data = params.as_json
    end
    puts "data=#{data}"
    head :no_content
    rule_processor = Rules::RuleProcessor.new
    rule_processor.define_rules
    rule_processor.apply_rules(data)
  end
end
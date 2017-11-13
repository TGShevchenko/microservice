module Rules
  ##
  # It represents a rule field to filter
  # the success data from an event.
  #
  class SuccessRuleField < BasicRuleField
    ##
    # Checks if a rule field value matches against
    # an event_type value from received event data
    #
    # @param [String] event_type
    # @return [TrueClass|FalseClass]
    #
    def rule_field_match?(event_type)
      @matching_value.eql? event_type
    end
  end
end
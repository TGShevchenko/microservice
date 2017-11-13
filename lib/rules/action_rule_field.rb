module Rules
  ##
  # It represents a rule field to filter
  # the action data from an event.
  #
  class ActionRuleField < BasicRuleField
    ##
    # Checks if a rule field value matches against
    # an action value from received event data
    #
    # @param [String] action
    # @return [TrueClass|FalseClass]
    #
    def rule_field_match?(action)
      @matching_value.eql? action
    end
  end
end

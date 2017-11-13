module Rules
  ##
  # It represents a rule field to filter
  # the object data from an event.
  #
  class ObjectRuleField < BasicRuleField
    ##
    # Checks if a rule field value matches against
    # an object value from received event data
    #
    # @param [String] object
    # @return [TrueClass|FalseClass]
    #
    def rule_field_match?(object)
      @matching_value.eql? object
    end
  end
end

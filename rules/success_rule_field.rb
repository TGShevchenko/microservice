module Rules
  class SuccessRuleField < BasicRuleField
    def rule_field_match?(event_type)
      @matching_value.eql? event_type
    end
  end
end
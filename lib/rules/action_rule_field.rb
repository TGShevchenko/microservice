module Rules
  class ActionRuleField < BasicRuleField
    def rule_field_match?(action)
      @matching_value.eql? action
    end
  end
end

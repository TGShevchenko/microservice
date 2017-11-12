module Rules
  class ObjectRuleField < BasicRuleField
    def rule_field_match?(object)
      @matching_value.eql? object
    end
  end
end

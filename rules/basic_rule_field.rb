module Rules
  class BasicRuleField
    #@field_attribute - a string value that identifies this rule with the attribute,
    #which has been taken from input event data
    attr_accessor :data_key, :matching_value

    def initialize
      @data_key = ''
      @matching_value = ''
    end

    def rule_field_match?(data_to_match)
      # Our basic rule field does not check any condition and it does not match
      false
    end
  end
end
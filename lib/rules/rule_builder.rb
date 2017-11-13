module Rules
  ##
  # It is responsible for creating a rule and keeping it in an array
  # for further use
  #
  class RuleBuilder
    attr_reader :rules

    def initialize
      @rules = []
    end

    ##
    # Adds a rule with defined rule attributes including
    # rule fields, subscribers and an action
    #
    # @param [Hash] rule_attributes
    # @return [Rules::RuleBuilder]
    #
    def add_rule(rule_attributes)
      rule = Rule.new(rule_attributes[:subscribers],
                      rule_attributes[:action])
      rule_field_attributes = rule_attributes[:rule_field_attributes]
      rule_field_attributes.each do |rule_field_attribute|
        data_key = rule_field_attribute[:data_key]
        matching_value = rule_field_attribute[:matching_value]
        rule.add_rule_field(rule_field_attribute[:rule_field_name],
                            {:data_key       => data_key,
                             :matching_value => matching_value}
        )
      end
      @rules << rule
      self
    end
  end
end
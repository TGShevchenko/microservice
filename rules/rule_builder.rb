module Rules
  class RuleBuilder
    attr_reader :rules

    def initialize
      @rules = []
    end

    def add_rule(rule_attributes)
      rule = Rule.new(rule_attributes[:subscribers],
                      rule_attributes[:action])
      rule_field_attributes = rule_attributes[:rule_field_attributes]
      rule_field_attributes.each do |rule_field_attribute|
        rule.add_rule_field(rule_field_attribute[:rule_field_name],
                            {:data_key       => rule_field_attribute[:data_key],
                             :matching_value => rule_field_attribute[:matching_value]}
        )
      end
      @rules << rule
      self
    end

    def build_rule
      # returns a created rule object
    end
  end
end
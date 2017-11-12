module Rules
  class Rule
    attr_reader   :subscribers
    attr_accessor :action

    def initialize(subscribers, action)
      @subscribers = subscribers
      @rule_fields = []
      @action = action
    end

    def add_rule_field(rule_field_name, attributes)
      rule_field = Rules.const_get(rule_field_name).new
      rule_field.data_key = attributes[:data_key]
      rule_field.matching_value = attributes[:matching_value]
      @rule_fields << rule_field
    end

    def rule_match?(data_map)
      @rule_fields.each do |rule_field|
        data_to_match = data_map[rule_field.data_key]
        #puts "Rule=#{self}. data_to_match=#{data_to_match}. RuleField=#{rule_field}"
        if !rule_field.rule_field_match? data_to_match
          return false
        end
      end
      @rule_fields.size > 0
    end

    def run_action
      action.run(self) if action
    end
  end
end
module Rules
  ##
  # It represents a rule, which contains several rule fields
  # in order to meet a filtering goal.
  #
  class Rule
    attr_reader :subscribers
    attr_accessor :action

    # @param [Array] subscribers
    # @param [Actions::BasicAction] action
    def initialize(subscribers, action)
      @subscribers = subscribers
      @rule_fields = []
      @action = action
    end

    ##
    # Adds a rule field with given attributes
    # and appends it to the rule_fields array
    #
    # @param [String] rule_field_name
    # @param [Hash] attributes
    #
    def add_rule_field(rule_field_name, attributes)
      rule_field = Rules.const_get(rule_field_name).new
      rule_field.data_key = attributes[:data_key]
      rule_field.matching_value = attributes[:matching_value]
      @rule_fields << rule_field
    end

    ##
    # Checks if a rule matches against received event data
    #
    # @param [Hash] data_map
    # @return [TrueClass|FalseClass]
    #
    def rule_match?(data_map)
      @rule_fields.each do |rule_field|
        data_to_match = data_map[rule_field.data_key]
        if !rule_field.rule_field_match? data_to_match
          return false
        end
      end
      @rule_fields.size > 0
    end

    ##
    # Runs an action assigned for this rule
    #
    def run_action
      action.run(self) if action
    end
  end
end
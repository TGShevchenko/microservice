module Rules
  ##
  # It represents a basic rule field that is a parent class for all
  # rule fields. The rule fields are being used in a rule in order to match
  # a value against received event data. A rule contains several rule fields
  # like this one in order to meet a filtering goal.
  #
  class BasicRuleField
    attr_accessor :data_key, :matching_value, :names, :emails

    def initialize
      @data_key = ''
      @matching_value = ''
      @names = []
      @emails = []
    end

    ##
    # Checks if a rule field value matches against
    # a given value from received event data
    #
    # @param [Object] data_to_match
    # @return [TrueClass|FalseClass]
    #
    def rule_field_match?(data_to_match)
      # Our basic rule field does not check any condition and it does not match
      false
    end
  end
end
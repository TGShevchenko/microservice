module Actions
  class BasicAction
    attr_accessor :message

    # @param [String] message
    def initialize(message)
      @message = message
    end

    ##
    # Runs an action using parameters from the rule.
    #
    # @param [Rules::Rule] rule
    #
    def run(rule)
      puts "Basic action for Rule=#{rule} is running with a message=#{@message}..."
    end
  end
end
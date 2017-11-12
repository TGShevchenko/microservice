module Actions
  class BasicAction
    attr_accessor :message

    def initialize(message)
      @message = message
    end

    def run(rule)
      puts "Basic action for Rule=#{rule} is running with a message=#{@message}..."
    end
  end
end
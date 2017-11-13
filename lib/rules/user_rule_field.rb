module Rules
  ##
  # It represents a rule field to filter
  # the user data from an event.
  # At the moment, it checks the agent_id data
  # because it exists in received event data.
  #
  class UserRuleField < BasicRuleField
    ##
    # Checks if a rule field value matches against
    # a user value from received event data
    #
    # @param [Integer] user_id
    # @return [TrueClass|FalseClass]
    #
    def rule_field_match?(user_id)
      @matching_value == user_id
    end

    ##
    # Checks if an email list contains a user
    # email from received event data
    #
    # @param [String] user_email
    # @return [TrueClass|FalseClass]
    #
    def check_user_email(user_email)
      @emails.each do |email|
        return true if email.eql? user_email
      end
      false
    end

    ##
    # Checks if a user list contains a user
    # name from received event data
    #
    # @param [String] user_name
    # @return [TrueClass|FalseClass]
    #
    def check_user_name(user_name)
      @names.each do |name|
        return true if name.eql? user_name
      end
      false
    end
  end
end
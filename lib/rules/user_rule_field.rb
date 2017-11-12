module Rules
  class UserRuleField < BasicRuleField
    def rule_field_match?(user)
      #puts "UserRuleField. user=#{user}"
      check_user_id(user)
    end

    def check_user_id(user_id)
      @matching_value == user_id
    end

    def check_user_email(user_email)
      @emails.each do |email|
        return true if email.eql? user_email
      end
      false
    end

    def check_user_name(user_name)
      @names.each do |name|
        return true if name.eql? user_name
      end
      false
    end
  end
end
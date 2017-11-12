module Rules
  class RuleProcessor
    attr_accessor :applied_rules

    def initialize
      @rule_builder = RuleBuilder.new
      @applied_rules = []
    end

    def define_rules
      add_rule_a
      add_rule_b
      add_rule_unlock_unsuccessful
    end

    def add_rule_a
      rule_attributes = {}
      rule_field_attributes = []
      rule_field_attributes << {rule_field_name: 'ActionRuleField',
                                data_key: 'action',
                                matching_value: 'update'}
      rule_field_attributes << {rule_field_name: 'ObjectRuleField',
                                data_key: 'object_type',
                                matching_value: 'Lock'}
      rule_field_attributes << {rule_field_name: 'SuccessRuleField',
                                data_key: 'success',
                                matching_value: true}
      rule_field_attributes << {rule_field_name: 'TimeRuleField',
                                data_key: 'created_at',
                                matching_value: '10:59'..'12:59'}
      rule_field_attributes << {rule_field_name: 'UserRuleField',
                                data_key: 'actor_id',
                                matching_value: 101768}
      rule_attributes[:rule_field_attributes] = rule_field_attributes
      rule_attributes[:action] = Actions::BasicAction.new('')
      rule_attributes[:subscribers] = %w(tgshevchenko@gmail.com altarangen@gmail.com)
      @rule_builder.add_rule(rule_attributes)
    end

    def add_rule_b
      rule_attributes = {}
      rule_field_attributes = []
      rule_field_attributes << {rule_field_name: 'ActionRuleField',
                                data_key: 'action',
                                matching_value: 'update'}
      rule_field_attributes << {rule_field_name: 'ObjectRuleField',
                                data_key: 'object_type',
                                matching_value: 'Lock'}
      rule_field_attributes << {rule_field_name: 'SuccessRuleField',
                                data_key: 'success',
                                matching_value: true}
      rule_field_attributes << {rule_field_name: 'TimeRuleField',
                                data_key: 'created_at',
                                matching_value: '2:59'..'23:59'}
      rule_field_attributes << {rule_field_name: 'UserRuleField',
                                data_key: 'actor_id',
                                matching_value: 101768}
      rule_attributes[:rule_field_attributes] = rule_field_attributes
      rule_attributes[:action] = Actions::BasicAction.new('')
      rule_attributes[:subscribers] = %w(tgshevchenko@gmail.com altarangen@gmail.com)
      @rule_builder.add_rule(rule_attributes)
    end

    def add_rule_unlock_unsuccessful
      rule_attributes = {}
      rule_field_attributes = []
      rule_field_attributes << {rule_field_name: 'ActionRuleField',
                                data_key: 'action',
                                matching_value: 'unlock'}
      rule_field_attributes << {rule_field_name: 'ObjectRuleField',
                                data_key: 'object_type',
                                matching_value: 'Lock'}
      rule_field_attributes << {rule_field_name: 'SuccessRuleField',
                                data_key: 'success',
                                matching_value: false}
      rule_field_attributes << {rule_field_name: 'UserRuleField',
                                data_key: 'actor_id',
                                matching_value: 101768}
      rule_attributes[:rule_field_attributes] = rule_field_attributes
      message = 'Dear user! Your unlock was unsuccessful! Best regards, Service Team.'
      rule_attributes[:action] = Actions::SendEmailAction.new(message)
      rule_attributes[:subscribers] = %w(tgshevchenko@gmail.com altarangen@gmail.com)
      @rule_builder.add_rule(rule_attributes)
    end

    def apply_rules(data_to_match)
      @applied_rules = []
      @rule_builder.rules.each do |rule|
        if rule.rule_match? data_to_match
          # Applying the matched rule
          puts "Rule matched=#{rule}"
          rule.run_action
          @applied_rules << rule
        end
      end
    end

  end
end
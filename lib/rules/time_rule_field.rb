module Rules
  ##
  # It represents a rule field to filter
  # the created_at data from an event using
  # a time interval
  #
  class TimeRuleField < BasicRuleField
    ##
    # Checks if a rule field value matches against
    # a time_string value from received event data
    #
    # @param [String] time_string
    # @return [TrueClass|FalseClass]
    #
    def rule_field_match?(time_string)
      time = DateTime.strptime(time_string, '%Y-%m-%dT%H:%M:%S%z').to_time
      time_in_allowed_range?(time)
    end

    ##
    # Returns true if a time parameter withing a given time interval
    #
    # @param [Time] time
    # @return [TrueClass|FalseClass]
    #
    def time_in_allowed_range?(time)
      range = @matching_value
      change_time_l = lambda {|range_part, time|
        hour, minute = range_part.split(':')
        time.change(hour: hour, min: minute)
      }
      from_time = change_time_l.call(range.first, time)
      to_time = change_time_l.call(range.last, time)
      (from_time..to_time).cover?(time)
    end
  end
end
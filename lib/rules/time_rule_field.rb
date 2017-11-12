module Rules
  class TimeRuleField < BasicRuleField
    def rule_field_match?(time)
      time = DateTime.strptime(time, '%Y-%m-%dT%H:%M:%S%z').to_time
      time_in_allowed_range?(time)
    end

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
require 'rails_helper'
require 'spec_helper'

describe 'Apply Rules' do
  it 'should run a Basic Action when the event action is "update", "object_type" is "Lock" and "success" is true' do
    data={
        'actor_type' => 'User',
        'actor_id' => 101768,
        'action' => 'update',
        'object_type' => 'Lock',
        'object_id' => 6344,
        'success' => true,
        'code' => 'ffffff',
        'message' => 'Taras updated lock Entrance Door.',
        'references' => [
            {'type' => 'Lock', 'id' => 6344},
            {'type' => 'Place', 'id' => 5142},
            {'type' => 'User', 'id' => 101768},
            {'type' => 'User', 'id' => 101768}
        ],
        'created_at' => '2017-11-12T17:39:52+00:00'
    }
    rule_processor = Rules::RuleProcessor.new
    rule_processor.define_rules
    rule_processor.apply_rules(data)
    rule_processor.applied_rules.each do |rule|
      rule.action.should be_instance_of Actions::BasicAction
    end
    rule_processor.applied_rules.size.should eql 1
  end

  it 'should run a SendEmail Action when the event action is "unlock", "object_type" is "Lock" and "success" is false' do
    data = {
        'actor_type' => 'User',
        'actor_id' => 101768,
        'action' => 'unlock',
        'object_type' => 'Lock',
        'object_id' => 6344,
        'success' => false,
        'code' => '34ffaa',
        'message' => 'Taras failed to unlock lock Entrance Door because they were accessing outside of opening hours.',
        'references' => [
            {'type' => 'Member', 'id' => 95142},
            {'type' => 'Lock', 'id' => 6344},
            {'type' => 'Place', 'id' => 5142},
            {'type' => 'User', 'id' => 101768},
            {'type' => 'User', 'id' => 101768}
        ],
        'created_at' => '2017-11-12T17:39:43+00:00'
    }
    rule_processor = Rules::RuleProcessor.new
    rule_processor.define_rules
    rule_processor.apply_rules(data)
    rule_processor.applied_rules.each do |rule|
      rule.action.should be_instance_of Actions::SendEmailAction
    end
    rule_processor.applied_rules.size.should eql 1
  end
end

require 'test_helper'

class ExpertTest < ActiveSupport::TestCase
  setup do
    @expert_1 = experts(:one)
    @expert_2 = experts(:two)
  end

  test "befriend" do
    assert @expert_1.friends.empty?
    assert @expert_2.friends.empty?

    @expert_1.befriend(@expert_2)

    assert @expert_1.friends.any?
    assert @expert_2.friends.any?
  end
end

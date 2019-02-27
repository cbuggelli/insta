require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should follow and unfollow a user" do
    chris = users(:chris)
    caboose  = users(:caboose)
    assert_not chris.following?(caboose)
    chris.follow(caboose)
    assert chris.following?(caboose)
    assert caboose.followers.include?(chris)
    chris.unfollow(caboose)
    assert_not chris.following?(caboose)
  end
end

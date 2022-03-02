require 'test_helper'
class PartTest < ActiveSupport::TestCase

test "for one character name" do
  s = Part.create({:name => "a"})
  refute s.valid?
  refute s.save
  assert_equal({:name=>["is too short (minimum is 2 characters)"]},
               s.errors.messages)
end
test "for two character name" do
  s = Part.create({:name => "aa"})
  assert s.valid?
  assert s.save
  assert_equal({}, s.errors.messages)
end
test "for empty name" do
  s = Part.create({:name => ""})
  refute s.valid?
  refute s.save
  assert_equal({:name=>["can't be blank","is too short (minimum is 2 characters)"]},
               s.errors.messages)
end

test "name should be uniqueness" do
  duplicable_part_id = @part.dup
  assert_not duplicable_part_id
end
end

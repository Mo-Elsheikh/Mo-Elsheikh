require 'test_helper'

class MakeTest < ActiveSupport::TestCase
  test "for one character name ,conutry " do
    s = Make.create({:name => "a" , :country=>"a"})
    refute s.valid?
    refute s.save
    assert_equal({ :country=>["is too short (minimum is 2 characters)"],:name=>["is too short (minimum is 2 characters)"]},
                 s.errors.messages)
  end
  test "for two character name, country" do
    s = Make.create({:name => "aa",:country=> "aa"})
    assert s.valid?
    assert s.save
    assert_equal({}, s.errors.messages)
  end
  test "for empty name, country" do
    s = Make.create({:name => "", :country =>""})
    refute s.valid?
    refute s.save
    assert_equal({:country=>["can't be blank", "is too short (minimum is 2 characters)"],
                  :name=>["can't be blank","is too short (minimum is 2 characters)"]},
                 s.errors.messages)
  end

  test "name should be uniqueness" do
    duplicable_make = @makes.dup
    assert_not duplicable_make
  end
end

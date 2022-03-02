require 'test_helper'

class CarTest < ActiveSupport::TestCase
  test "for one character make, modle, vin_number " do
    s = Car.create({:make=> "a" , :model=>"a", :vin_number=>"a"})
    refute s.valid?
    refute s.save
    assert_equal({ :make=>["is too short (minimum is 2 characters)"],
                   :vin_number=>["is too short (minimum is 19 characters)"],
                   :many_part=>["can't be blank", "is not a number"],
                   :model=>["is too short (minimum is 2 characters)"]},
                 s.errors.messages)
  end

  test "for empty make, model, vin_number,many_part" do
    s = Car.create({:make=> "",:model=>"" , :vin_number=>"",:many_part=>""})
    refute s.valid?
    refute s.save
    assert_equal({:make=>["can't be blank", "is too short (minimum is 2 characters)"],
                  :model=>["can't be blank", "is too short (minimum is 2 characters)"],
                  :many_part=>["can't be blank", "is not a number"],
                  :vin_number=>["can't be blank","is too short (minimum is 19 characters)"]},
                 s.errors.messages)
  end

  test "make,model,vin_number should be uniqueness" do
    duplicable_car_id = @car.dup
    assert_not duplicable_car_id
  end
end

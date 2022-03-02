class Car < ApplicationRecord
  # Declare the relationship between cars and makes
  # Declare the relationship between car and parts
  has_and_belongs_to_many :parts # Cars has many parts and belongs to the parts
  has_one :makes # Cars has one make

  # Vin number most by unique and not less 19 not more 23 character, not blank
  validates :vin_number, uniqueness: true, presence: true, length: {minimum: 19,maximum: 23, greater_than: 0.0}
  # Model most by unique and not less 2 not more  character, not blank
  validates :model, presence: true, uniqueness: true,length: {minimum: 2,maximum:35, greater_than: 0.0}
  # Many part most by unique and integer only, greater than zero, not blank
  validates :many_part, presence: true, numericality: { only_integer: true , greater_than: 0.0}
  # Make most by not less tow and more 35 character, not blank
  validates :make, presence:true, length: {minimum: 2 , maximum: 35,greater_than: 0.0}

# Search for all index Car model, make, vin number, many part
  def self.search(search)
    if search
      where (["model LIKE ?", "%#{search}%"])
      where (["vin_number LIKE ?", "%#{search}%"])
      where (["make LIKE ?", "%#{search}%"])
      where (["many_part LIKE ?", "%#{search}%"])
    else
      all
    end
  end

end



class Make < ApplicationRecord
  # Declare the relationship between Make and Cars
  has_many :car # Makes has many cars
  # Country most by not less 2 not more 30 character, not blank
  validates :country,presence:true, length: {minimum: 2, maximum:30, greater_than: 0.0 }
  # Name most by unique and not less 2 not more 30 character, not blank
  validates :name, presence: true,uniqueness: true, length: {minimum:2, maximum: 30, greater_than: 0.0}
  #Search for index countrya nad name
  def self.search(search)
    if search
      where (["name LIKE ?", "%#{search}%"])
      where (["country LIKE ?", "%#{search}%"])
    else
      all
    end
  end
end

class Part < ApplicationRecord
  # Declare the relationship between Part and Cars
  has_and_belongs_to_many :cars # Part has many Cras and belongs to the Cars
  # Name most by unique and not less 2 not more 30 character, not blank
  validates :name, presence: true, uniqueness: true, length: {minimum:2, maximum: 30, greater_than: 0.0}
  # Search for index name
  def self.search(search)
    if search
      where (["name LIKE ?", "%#{search}%"])
    else
      all
    end
  end
def is_number?
  self =~/^\d+$/

end
end

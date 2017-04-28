class Ninja < ActiveRecord::Base
  belongs_to :dojo
  validates :first_name, presence: { message: "can't be blank. Must be 4 length"}
  validate :length_of_name_has_to_be_4

  def length_of_name_has_to_be_4
  	if first_name != nil
  		if first_name.length != 4
  			errors.add(:first_name, "has to be 4 of length")
  		end
  	end
  end
end

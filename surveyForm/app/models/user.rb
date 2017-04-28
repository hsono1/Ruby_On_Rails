class User < ActiveRecord::Base
	validates :name, :dojo_location, :fav_language, presence: true
	validates :name, length: { minimum: 2}
end

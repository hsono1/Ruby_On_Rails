class User < ActiveRecord::Base
	has_many :friendships
	has_many :friends, class_name: "User", through: :friendships
end

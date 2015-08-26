class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => 'User'

	validates :user_id, presence: true, numericality: { only_integer: true }
	validates :friend_id, presence: true, numericality: { only_integer: true }
end
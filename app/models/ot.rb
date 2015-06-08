class Ot < ActiveRecord::Base
	belongs_to :user

	validates :startingtime, presence: true
	validates :endingtime, presence:true
	validates :day, presence:true 
end

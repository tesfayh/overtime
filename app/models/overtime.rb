class Overtime < ActiveRecord::Base
	default_scope  { order ("sdayofot ASC") }

	belongs_to :user
	
	validates :sdayofot, presence: true, uniqueness: true	
	validates :edayofot, presence: true, uniqueness: true

end

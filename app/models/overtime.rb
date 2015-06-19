class Overtime < ActiveRecord::Base
	default_scope  { order ("sdayofot ASC") }

	belongs_to :user
	
	validates :sdayofot, presence: true, uniqueness: true # => { :scope => :user_id,
    #:message => "Users should only enter one OT per  day." }
	
end

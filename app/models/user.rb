class User < ActiveRecord::Base

	has_secure_password
	has_many :ots
	has_many :overtimes
	
	validates :email, presence: true, uniqueness: true,format: {with: /^[\w\.+-]+@([\w]+\.)+[a-zA-Z]+$/, :multiline => true }
	validates :username, presence:true, uniqueness:true
	validates :name, presence:true
end

require 'bcrypt'
class User < ActiveRecord::Base
	has_secure_password
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates 	:username, 		:presence 	=> true,
								:uniqueness => { :case_sensitive => false },
								:length 	=> { in: 2..12 }
	validates 	:password, 		:length		=> { in: 8..16 }
	validates 	:email,			:presence	=> true,
								:format		=> { :with => email_regex } 
	before_save do
  		self.admin = 'false'
  	end
end

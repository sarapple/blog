class User < ActiveRecord::Base
  	before_save do
  		self.admin = 'false'
  	end
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates 	:username, 		:presence 	=> true,
								:uniqueness => { :case_sensitive => false },
								:length 	=> { in: 2..12 }
	validates 	:password, 		:presence	=> true, 
								:length		=> { in: 8..16 }
	validates 	:email,			:presence	=> true,
								:uniqueness => { :case_sensitive => false },
								:format		=> { :with => email_regex }
	       						
end

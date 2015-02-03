class User < ActiveRecord::Base
  	before_save do
  		self.admin = 'false'
  	end
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :username, :password, presence: true, length: { in: 2..8 }
	validates 	:email,			:presence	=> true,
								:format		=> { :with => email_regex },
	       						:uniqueness => { :case_sensitive => false }
end

class User < ActiveRecord::Base
  	before_save do
  		self.admin = 'false'
  	end
end

class Comment < ActiveRecord::Base
	belongs_to 	:user
	belongs_to 	:post
	validates 	:message, 		:presence	=> true,
								:length		=> { in: 5..100 }
end

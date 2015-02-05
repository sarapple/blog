class Post < ActiveRecord::Base
	has_many 	:comments
	belongs_to 	:user
	validates 	:title, 		:presence	=> true,
								:length		=> { in: 5..250 }
	validates 	:content,		:presence	=> true,
								:length		=> { in: 5..250 }
end

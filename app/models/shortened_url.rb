class ShortenedUrl < ActiveRecord::Base 

	def self.random_code 
		code = '123'
		while self.exists?(short_url: code) 
			code = SecureRandom.base64
		end
		code
	end

	def self.create_for_user_and_long_url!(user, long_url) 
		ShortenedUrl.create({short_url: ShortenedUrl.random_code, long_url: long_url, submitter_id: user} ) 
	end

	belongs_to( 
		:submitter, 
		class_name: :User,
		foreign_key: :submitter_id,
		primary_key: :id
		)


	validates :short_url, uniqueness: true, presence: true 
	validates :long_url, presence: true 
	validates :submitter_id, presence: true 


end



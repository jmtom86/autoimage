class Customer < ActiveRecord::Base
	validates :first_name, :last_name, presence: true
	has_many :jobs


	def self.search(search)
		where("first_name LIKE ?" "%@{search}%")
	end
end

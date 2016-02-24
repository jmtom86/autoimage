class Customer < ActiveRecord::Base
	validates :first_name, :last_name, presence: true
	has_many :jobs, dependent: :destroy


	def self.search(search)
		where("first_name LIKE ?" "%@{search}%")
	end
end

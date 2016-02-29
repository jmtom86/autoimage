class Customer < ActiveRecord::Base
	validates :first_name, :last_name, presence: true
	has_many :jobs, dependent: :destroy


	def self.search(search)
		if search
			find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end
end

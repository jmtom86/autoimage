class Job < ActiveRecord::Base
  belongs_to :customer, dependent: :destroy
  has_many :tintjobs
  
end

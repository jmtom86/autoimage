class Tintjob < ActiveRecord::Base
  belongs_to :tint
  belongs_to :job, dependent: :destroy
end

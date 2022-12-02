class JobTemplate < ApplicationRecord
  has_many :jobs
  has_many :job_attributes
end

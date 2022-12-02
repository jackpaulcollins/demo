class JobAttributeAnswer < ApplicationRecord
  belongs_to :job_attribute
  belongs_to :job
  validates :answer, presence: true
end

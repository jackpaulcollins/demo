class JobAttributeAnswer < ApplicationRecord
  belongs_to :job_attribute
  validates :answer, presence: true
end

class Job < ApplicationRecord
  belongs_to :job_template
  has_many :job_attribute_answers, dependent: :destroy
  accepts_nested_attributes_for :job_attribute_answers
end

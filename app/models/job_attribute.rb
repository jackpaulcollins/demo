class JobAttribute < ApplicationRecord
  belongs_to :job_template
  has_many :job_attribute_answers, dependent: :destroy
  validates :name, presence: true
  validates :job_template, presence: true

  accepts_nested_attributes_for :job_attribute_answers
end

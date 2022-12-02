class Job < ApplicationRecord
  belongs_to :job_template
  has_many :job_attribute_answers, dependent: :destroy
  accepts_nested_attributes_for :job_attribute_answers

  def set_template_answers(attribute_id, answer)
    if !new_record? && template_changing?
      job_attribute_answers.destroy_all
    end
  
    if job_attribute_answers.where(job: self, job_attribute_id: attribute_id).exists?
      JobAttributeAnswer.find_by(job_attribute_id: attribute_id).update(job: self, answer: answer)
    else
      JobAttributeAnswer.create(job: self, job_attribute_id: attribute_id, answer: answer)
    end
  end

  def template_changing?
    job_template_id_previously_was != job_template_id
  end
end

class RemovejobTwo < ActiveRecord::Migration[7.0]
  def change
    remove_reference :job_attribute_answers, :job
  end
end

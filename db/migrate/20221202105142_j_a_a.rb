class JAA < ActiveRecord::Migration[7.0]
  def change
    add_reference :job_attribute_answers, :job
  end
end

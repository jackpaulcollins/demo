class AddJobToJobAttributes < ActiveRecord::Migration[7.0]
  def change
    add_reference :job_attributes, :job
  end
end

class Removejob < ActiveRecord::Migration[7.0]
  def change
    remove_reference :job_attributes, :job
  end
end

class CreateJobTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :job_templates do |t|
      t.string :title, null: false
      t.timestamps
    end

    create_table :job_attributes do |t|
      t.belongs_to :job_template, null: false, foreign_key: true
      t.string :name, null: false
      t.timestamps
    end
    add_reference :jobs, :job_template, index: true
  end
end

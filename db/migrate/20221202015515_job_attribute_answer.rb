class JobAttributeAnswer < ActiveRecord::Migration[7.0]
  def change
    create_table :job_attribute_answers do |t|
      t.belongs_to :job_attribute, null: false, foreign_key: true
      t.belongs_to :job, null: false, foreign_key: true
      t.string :answer, null: false
      t.timestamps
    end
  end
end

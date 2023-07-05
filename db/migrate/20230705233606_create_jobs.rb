class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :company
      t.string :location
      t.string :employment_type
      t.decimal :salary
      t.string :experience_level
      t.string :education_level
      t.string :skills
      t.date :posted_date
      t.date :application_deadline

      t.timestamps
    end
  end
end

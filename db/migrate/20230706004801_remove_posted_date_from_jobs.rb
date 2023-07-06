class RemovePostedDateFromJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :posted_date, :date
  end
end

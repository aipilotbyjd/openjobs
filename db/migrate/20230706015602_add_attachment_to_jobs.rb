class AddAttachmentToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :attachment, :string
  end
end

class JobApplication < ApplicationRecord
  belongs_to :job
  belongs_to :user

  # Additional fields and validations for the job application model
  # validates :name, presence: true
  # validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :resume, presence: true
end

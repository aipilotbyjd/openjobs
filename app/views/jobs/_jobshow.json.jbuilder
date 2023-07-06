json.extract! job, :id, :title, :description, :company, :location, :employment_type, :salary, :experience_level, :education_level, :skills, :application_deadline, :created_at, :updated_at
json.url job_url(job, format: :json)

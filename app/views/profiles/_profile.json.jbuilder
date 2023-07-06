json.extract! profile, :id, :name, :bio, :resume, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)

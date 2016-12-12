json.extract! submission, :id, :user_id, :assignment_id, :description, :created_at, :updated_at
json.url submission_url(submission, format: :json)
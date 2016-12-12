json.extract! project, :id, :name, :description, :criteria, :deliverables, :related, :created_at, :updated_at
json.url project_url(project, format: :json)
json.extract! course, :id, :name, :code, :semester, :created_at, :updated_at
json.url course_url(course, format: :json)
json.extract! slidedeck, :id, :title, :created_at, :updated_at
json.url slidedeck_url(slidedeck, format: :json)
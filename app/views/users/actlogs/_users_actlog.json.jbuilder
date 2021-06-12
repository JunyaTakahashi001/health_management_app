json.extract! users_actlog, :id, :created_at, :updated_at
json.url users_actlog_url(users_actlog, format: :json)

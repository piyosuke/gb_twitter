json.extract! event_ranking, :id, :event_count, :ranking, :name, :rank, :total_kill, :total_contribution, :created_at, :updated_at
json.url event_ranking_url(event_ranking, format: :json)

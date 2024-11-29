json.extract! my_monitor, :id, :url, :schedule_interval, :created_at, :updated_at
json.url my_monitor_url(my_monitor, format: :json)

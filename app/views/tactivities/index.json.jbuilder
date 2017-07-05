json.array!(@tactivities) do |tactivity|
  json.extract! tactivity, :task_id, :name, :description, :begins_at, :ends_at
  json.url task_tactivity_url([@task,tactivity], format: :json)
end

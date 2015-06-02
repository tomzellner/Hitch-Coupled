json.array!(@searches) do |search|
  json.extract! search, :id, :start_city, :start_state, :end_city, :end_state, :new, :show
  json.url search_url(search, format: :json)
end

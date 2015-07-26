json.array!(@shorteners) do |shortener|
  json.extract! shortener, :id, :long, :short, :user_id, :create
  json.url shortener_url(shortener, format: :json)
end

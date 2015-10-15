json.array!(@pianos) do |piano|
  json.extract! piano, :id, :name
  json.url piano_url(piano, format: :json)
end

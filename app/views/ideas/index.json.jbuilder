json.array!(@ideas) do |idea|
  json.extract! idea, :id, :title, :description, :link
  json.url idea_url(idea, format: :json)
end

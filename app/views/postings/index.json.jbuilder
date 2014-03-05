json.array!(@postings) do |posting|
  json.extract! posting, :id, :body, :user_id
  json.url posting_url(posting, format: :json)
end

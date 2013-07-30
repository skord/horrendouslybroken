json.array!(@buckets) do |bucket|
  json.extract! bucket, 
  json.url bucket_url(bucket, format: :json)
end

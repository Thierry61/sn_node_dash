# Empty an InfluxDb bucket.
# Works on both local InfluxDB OSS and InfluxDB Cloud with appropriate environment variables
# (bucket, url, token, organization)

# Define needed environment variables
. env.sh

curl --request POST "$url/api/v2/delete?org=$organization&bucket=$bucket" \
  --header "Authorization: Token $token" \
  --header 'Content-Type: application/json' \
  --data '{
    "start": "1970-01-01T00:00:00Z",
    "stop":  "2100-01-01T00:00:00Z"
  }'
  
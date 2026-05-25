token = os.getenv("BEARER_TOKEN")

request = function()
  local body = '{"vehicle":"Suv","pickup":{"latitude":51.0416,"longitude":3.6697},"dropoff":{"latitude":51.0543,"longitude":3.7174}}'
  wrk.headers["Content-Type"] = "application/json"
  wrk.headers["Authorization"] = token
  return wrk.format("POST", "/ride", nil, body)
end

response = function(status, headers, body)
  if status >= 400 and status < 500 then
    io.write("HTTP " .. status .. ": " .. body .. "\n")
    io.flush()
  end
end
require 'sinatra'

# probes
get '/health/liveness' do
  status 200
  body 'liveness: ok'
end

get '/health/startup' do
  status 200
  body 'startup: ok'
end

# curl -X GET "http://localhost/sum?a=10&b=1000222" -sv
get '/sum' do
  begin
    a = request["a"].to_i
    b = request["b"].to_i
    body "#{a + b}"
  rescue Exception => e
    "Bad math expression: #{e.message}."
  end
end

run Sinatra::Application

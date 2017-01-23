ENV["REDISTOGO_URL"] ||= "redis://rediscloud:z34jmwe6geRgT6op@redis-15584.c11.us-east-1-3.ec2.cloud.redislabs.com:15584"
uri = URI.parse(ENV["REDISTOGO_URL"])
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
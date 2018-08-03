Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{ENV['REDIS_HOST']}" }
  puts ENV['REDIS_HOST']
end

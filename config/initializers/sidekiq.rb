Sidekiq.configure_server do |config|
  config.redis = { :url => "redis://#{Settings.redis.server}:6379/0", namespace: "#{Settings.redis.namespace}" }
end
Sidekiq.configure_client do |config|
  config.redis = { :url => "redis://#{Settings.redis.server}:6379/0", namespace: "#{Settings.redis.namespace}" }
end
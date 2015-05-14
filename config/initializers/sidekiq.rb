Sidekiq.configure_server do |config|
  config.redis = { :url => "redis://#{Settings.sidekiq}:6379", namespace: 'kakitube' }
end
Sidekiq.configure_client do |config|
  config.redis = { :url => "redis://#{Settings.sidekiq}:6379", namespace: 'kakitube' }
end
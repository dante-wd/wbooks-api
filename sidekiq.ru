require 'sidekiq/web'

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis:6379/0', password: 'yourpassword' }
end

run Sidekiq::Web
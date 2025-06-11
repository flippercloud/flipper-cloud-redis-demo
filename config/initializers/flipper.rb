Rails.application.configure do
  ## Memoization ensures that only one adapter call is made per feature per request.
  ## For more info, see https://www.flippercloud.io/docs/optimization#memoization
  # config.flipper.memoize = true

  ## Flipper preloads all features before each request, which is recommended if:
  ##   * you have a limited number of features (< 100?)
  ##   * most of your requests depend on most of your features
  ##   * you have limited gate data combined across all features (< 1k enabled gates, like individual actors, across all features)
  ##
  ## For more info, see https://www.flippercloud.io/docs/optimization#preloading
  # config.flipper.preload = true

  ## Warn or raise an error if an unknown feature is checked
  ## Can be set to `:warn`, `:raise`, or `false`
  config.flipper.strict = false
  config.flipper.actor_limit = false

  ## Show Flipper checks in logs
  # config.flipper.log = true

  ## Reconfigure Flipper to use the Memory adapter and disable Cloud in tests
  # config.flipper.test_help = true

  ## The path that Flipper Cloud will use to sync features
  # config.flipper.cloud_path = "_flipper"

  ## The instrumenter that Flipper will use. Defaults to ActiveSupport::Notifications.
  # config.flipper.instrumenter = ActiveSupport::Notifications
end

Flipper.configure do |config|
  # Customize your redis instance here. Can be connection pool, redis instance,
  # or whatever you want. If you don't need to customize, you can just use the
  # redis url env vars (e.g. FLIPPER_REDIS_URL, REDIS_URL, etc.)
  #
  # If you want to use a connection pool, you can do this:
  #
  # Flipper::Adapters::Redis.new(ConnectionPool.new { Redis.new })
  #
  # If you want to customize uncomment the following block and do whatever you want.
  # config.adapter do
  #   # customize Redis.new...
  #   Flipper::Adapters::Redis.new(Redis.new(...))
  # end
end

## Register a group that can be used for enabling features.
##
##   Flipper.enable_group :my_feature, :admins
##
## See https://www.flippercloud.io/docs/features#enablement-group
#
# Flipper.register(:admins) do |actor|
#  actor.respond_to?(:admin?) && actor.admin?
# end

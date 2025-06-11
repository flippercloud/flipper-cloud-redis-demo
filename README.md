# Flipper Cloud Redis Demo

This is a demonstration of using Flipper Cloud with Redis as a local adapter. This setup allows you to use Flipper Cloud's feature flag management capabilities while storing the feature flag data locally in Redis.

## Install

Ruby 3.4.2 (`asdf install ruby 3.4.2` if you don't have it and use asdf).

```
bundle
```

Add token to rails credentials:
```
rails credentials:edit
```

Paste this in:
```
flipper:
  cloud_token: <your personal environment token>
```

Or you can use FLIPPER_CLOUD_TOKEN env var like this:

```
FLIPPER_CLOUD_TOKEN=<your api token here> bin/rails s
```

## Console

Here is an example of forcing a sync to an environment that has demo_feature enabled:

```
bin/rails c
# or FLIPPER_CLOUD_TOKEN=<token> bin/rails c

Loading development environment (Rails 8.0.2)
flipper-cloud-redis-demo(dev)> Flipper::Adapters::Redis.new(Redis.new).get_all
=> {"demo_feature" => {boolean: "true", expression: nil, actors: #<Set: {}>, percentage_of_actors: nil, percentage_of_time: nil, groups: #<Set: {}>}}
```

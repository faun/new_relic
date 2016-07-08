# New Relic

### Events

For each host within an organization, events should be storable and retrievable. Events consist of:

  - timestamp

  - payload

  - host_id

  - organization_id

Events can come from multiple organizations and an organization can have multiple hosts.

### Application Prerequisites:

* Ruby 2.3.0
* PostgreSQL

### Setup:

```
bundle install
bundle exec rake db:migrate
```

How to run the test suite:

```
bundle exec rspec
```


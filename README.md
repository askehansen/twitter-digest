# README

## Twitter developer app
First create a twitter app here: https://developer.twitter.com/en/apps

Configure the callback url to `https://[your-hostname]/auth/twitter/callback`

Note the *API key* and *API secret key*.

## Encryption string
Consumer keys for signed up twitter users are encrypted before stored in the database using a 256 bit encryption string (https://github.com/attr-encrypted/attr_encrypted#usage).

You need to generate this string and you can use the following ruby code:

```ruby
require "securerandom"
SecureRandom.alphanumeric(32)
```

This will be the key for encrypting/decrypting twitter consumer keys so be careful of it.

## Running the app locally

### System dependencies
- Ruby
- Node
- Yarn
- Postgres

Create a file called `app/config/application.yml` with the following content:
```YAML
TWITTER_KEY:    [twitter api key]
TWITTER_SECRET: [twitter api secret key]
ENCRYPTION_KEY: [256 bit encrypting string]
```


`$ bundle install`

`$ yarn install`

`$ rm config/credentials.yml.enc`

`$ rails credentials:edit`

`$ rails db:setup`

`$ rails server`


## Running the app on heroku

### Heroku addons
- Heroku postgres
- Sendgrid
- Scheduler

### Environment variables
```
heroku config:set TWITTER_KEY=[twitter api key] \
  TWITTER_SECRET=[twitter api secret key] \
  ENCRYPTION_KEY=[256 bit encrypting string] \
  MASTER_KEY=[found in config/master.key]
```

### Scheduled tasks
Open heroku scheduler with `$ heroku addons:open scheduler`

Set a task to run every hour at :00 with `$ rake daily_digests:create`

Set a task to run every hour at :00 with `$ rake daily_digests:deliver`

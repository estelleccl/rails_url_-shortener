# URL shortener Ruby on Rails app https://url2.herokuapp.com/

Attempts to stimulate and overcome if 10,000 people trying to shorten urls every minute.

- use sql statement instead of activerecord
- index the url table and short_url
- pluck all the short_url from the database and find whether the url exist of not - if exist then only search
- click counter push to background job via sidekiq/active job
# URL shortener Ruby on Rails app https://url2.herokuapp.com/

Attempts to stimulate and overcome if 10,000 people trying to shorten urls every minute, what would the bottlenecks be

- 1) use sql statement instead of activerecord
- 2) index the url table and short_url
- 3) pluck all the short_url from the database and find whether the url exist of not - if exist then only search
- 4) wip - if server busy - push to background job via sidekiq/active job
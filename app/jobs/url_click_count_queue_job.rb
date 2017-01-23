class UrlClickCountQueueJob < ActiveJob::Base
  queue_as :default

  def perform(short_url)
  	url = Url.find_by(short_url: url)
    url.counter
  end
end

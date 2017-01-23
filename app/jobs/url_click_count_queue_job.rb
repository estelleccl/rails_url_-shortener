class UrlClickCountQueueJob < ActiveJob::Base
  queue_as :default

  def perform(url)
    url.counter
  end
end

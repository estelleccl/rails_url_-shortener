class Url < ActiveRecord::Base
	validates_uniqueness_of :long_url, confirmation: true
  validates_presence_of :long_url, confirmation: true
  validates_format_of :long_url, :with => URI::regexp(%w(http https)), confirmation: true
end

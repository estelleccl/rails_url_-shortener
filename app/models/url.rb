class Url < ActiveRecord::Base
	validates_uniqueness_of :long_url, confirmation: true
  validates_presence_of :long_url, confirmation: true
  validates_format_of :long_url, :with => URI::regexp(%w(http https)), confirmation: true

  before_create :generate_short_link

  def counter
    self.click_count += 1
    save
  end

  private
  def generate_short_link
    self.short_url = (0...8).map{(65 + rand(26)).chr}.join
  end
end
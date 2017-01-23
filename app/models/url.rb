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
    random_text = SecureRandom.hex(4)
    if pluck_short_url.include? random_text
      generate_short_link
    else
      self.short_url = random_text
    end
  end

  def pluck_short_url
    Url.pluck(:short_url)
  end
end
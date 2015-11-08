class Poster < ActiveRecord::Base
  has_many :message_items
  before_save :clean_name

  # Sanitize the name to prevent XSS/Injection
  def clean_name
    self.name = Loofah.fragment(self.name).scrub!(:strip).text
  end
end

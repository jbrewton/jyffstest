class MessageItem < ActiveRecord::Base
  belongs_to :poster
  validates :poster, presence: true
  after_create :publish_message
  before_save :clean_message

  # Sanitize the message to prevent XSS/Injection
  def clean_message
    self.message = Loofah.fragment(self.message).scrub!(:strip).text
  end

  # Data structure to publish to subscribers
  def format_for_publish
    obj = {poster_name: poster.name, message: self.message}
    obj.to_json
  end

  # Notify all of the listening clients when a message is created
  def publish_message
    $redis.publish "chat", format_for_publish
  end

  # Gets the name of the poster
  def poster_name
    poster.name
  end

end

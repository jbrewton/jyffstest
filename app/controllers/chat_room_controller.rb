class ChatRoomController < ApplicationController
  include Tubesock::Hijack

  # Handles the websocket so connected clients can subscribe to the message notifications
  def livechat
    hijack do |tubesock|
      # Listen on its own thread
      redis_thread = Thread.new do
        # Needs its own redis connection to pub
        # and sub at the same time
        Redis.new(:host => ENV['CACHE_NODE'], :port => 6379).subscribe "chat" do |on|
          on.message do |channel, message|
            tubesock.send_data message
          end
        end
      end
      
      tubesock.onclose do
        # stop listening when client leaves
        redis_thread.kill
      end
    end
  end
end
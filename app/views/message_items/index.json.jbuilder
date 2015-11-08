json.array!(@message_items) do |message_item|
  json.extract! message_item, :id, :message, :poster_name
end

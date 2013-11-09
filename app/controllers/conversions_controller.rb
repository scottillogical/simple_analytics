class ConversionsController < ApplicationController

  def create 
    event = Event.new(event_type: 'conversion')
    event.user_id = params["user_id"]
    event.apply_request_attributes(request, find_or_create_network_user_id)
    EventWorker.perform_async(event.attributes)
    send_blank_gif
  end
end

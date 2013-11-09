class PageViewsController < ApplicationController

  def create 
    event = Event.new(event_type: 'page_view')
    event.apply_request_attributes(request, find_or_create_network_user_id)
    #EventWorker.perform_async(event.attributes)
    event.save!
    send_blank_gif
  end
end

class RedirectsController < ApplicationController
  def new
    event = Event.new(event_type: 'redirect')
    event.referrer = request.referrer
    event.apply_request_attributes(request, find_or_create_network_user_id)
    event.destination_url = params[:dest]
    EventWorker.perform_async(event.attributes)
    redirect_to CGI::unescape params[:dest]
  end
end

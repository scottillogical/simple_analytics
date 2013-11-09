require 'uri'

class Event < ActiveRecord::Base

  def apply_request_attributes(request, network_user_id)
    self.network_user_id = network_user_id
    self.url = request.referer
    self.referrer = request.params[:referrer] if request.params[:referrer]
    self.user_agent = request.user_agent
    self.item_id = request.params[:item_id] if request.params[:item_id]
    self.item_desc = request.params[:item_desc] if request.params[:item_desc]
    self.ip_address = request.ip
    self.app_id = request.params["app_id"]
    self.pixel_url = request.url if request.url.present?
    if request.referrer and self.referrer.blank?
      uri = URI(request.referrer)
      self.page_urlhost = uri.host
      self.page_path = uri.path
      self.page_query = uri.query
    end
    ['utm_source', 'utm_medium','utm_campaign','utm_term','utm_content'].each do |p|
      self.send("#{p}=", request.params[p])
    end
    self.event_desc = request.params["event_desc"]

  end
end

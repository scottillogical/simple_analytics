class TrackingUrlsController < ApplicationController

  before_filter :authenticate_admin!
  def new 
    @tracking_url = OpenStruct.new
  end

  def show
  end

  def create
    if params['redirect_url_options']['type'] == 'redirect'
      redirect_url_options= params['redirect_url_options']
      tracking_url = "http://simpleanalyticsurl.com"
      tracking_opts = {}
      tracking_opts['dest'] = CGI.escape(redirect_url_options['dest'])
      tracking_url += tracking_opts.to_query 
      redirect_to tracking_url_path(1, tracking_url: tracking_url)
    end

  end
end

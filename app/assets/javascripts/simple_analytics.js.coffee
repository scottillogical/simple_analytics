class @SimpleAnalytics
  url: ''
  app_id: ''
  getDomainUserId: ->
    if $.cookie('domain_user_id')
      $.cookie('domain_user_id')
    else
      domain_user_id = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace /[xy]/g, (c) ->
        r = Math.random() * 16 | 0
        v = (if c is "x" then r else (r & 0x3 | 0x8))
        v.toString 16
      $.cookie('domain_user_id', domain_user_id)
      domain_user_id

  trackEvent: (event_desc, item_id, item_desc) ->
    pixel = new Image()
    params = {}
    params['timestamp'] = new Date().getTime()
    params['referrer'] = document.referrer
    params['domain_user_id'] = this.getDomainUserId()
    params['app_id'] = this.app_id
    params['event_desc'] = event_desc
    if item_id
      params['item_id'] = item_id
    if item_desc
      params['item_desc'] = item_desc
    pixel.src = "#{this.url}/events/create?#{$.param(params)}"


  trackPageView: ->
    pixel = new Image()
    params = {}
    params['timestamp'] = new Date().getTime()
    params['referrer'] = document.referrer
    params['domain_user_id'] = this.getDomainUserId()
    params['app_id'] = this.app_id

    
    pixel.src = "#{this.url}/page_views/create?#{$.param(params)}"




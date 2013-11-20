**simple_analytics** is an example of my idea of simple, custom alternative to google analytics, mixpanel, or snowplow.js for doing event tracking across multiple domains.

Inspired by [snowplow.js](http://github.com/snowplow/snowplow)


## What records

*  Tracks page views 
*  Tracks conversions, on your site or your partners site
*  Tracks ad clicks (what ad they clicked on, where they want) by providing redirect links using [google campaign parameters](https://support.google.com/analytics/answer/1033867?hl=en)

## How it works

The general idea is that the sites the user is interacting with are making a bunch of get requests to simple_analytics, using javascript, image pixels, and a redirector as a click tracker.  All the data we need is stored in the query string parameters of the request.   We can either log this directly to a database async using something like Sideqik/Resque, or go through the logs later and put them into whatever database for ease of reporting.

**page views** 

In public/page_view_test  you can see an an example of how to log a page view.  It consists of merely initializing the simple_analytics tracking snippet and logging a page view.   For simplicity sake, this is currently doing using jquery async, but it could be changed to push and pull off a stack of events to log, much like mixpanel or GA.

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type='text/javascript' src='http://localhost:4017/assets/tracking.js' ></script>
    <!-- simple_analytics tracking-->
    <script type="text/javascript">
      $(document).ready(function() {
        var simple_analytics = new SimpleAnalytics()
        simple_analytics.url = "http://localhost:4017"
        simple_analytics.app_id = "test"
        simple_analytics.trackPageView();
      });
    </script>

**Conversions**  
in public/conversion_test you can an example of a conversion pixel in action, look like this:  

    <img src="http://your_simple_analytics_url.com/conversions/create?app_id=test" />


**Arbritary Event Logging *** 

If you want to log arbitrary events via javascript, like a user bookmarking a product, social sharing, you can track entirely arbitrary events using the javascript API

    window.simple_analytics.trackEvent('event-name', item_id, item_description);


**Redirector for referral tracking/paid traffic** 

When you drive paid traffic at your app, you want to be able to tie user actions back to the keyword or display ad.  This can be as simple as tracking if someone bought a product on your site, or signed up on your site.  You might also want to track page views.   More importantly, if you have multiple sites, you might want to track as a user bounces back and forth between the sites.   And, lastly, you might want to track if a user converts on a parternes 3rd party site that you are linking to or advertising.   You might want to track all these events and tie them back to the original ad you placed on google. 

Redirect urls look like this

    http://your_simple_analytics_url.com/redirect/new?utm_source=test&utm_medium=test&utm_term=test&utm_content=test&utm_campaign=test&dest=SOME_ENCODED_URL
    
This drops a cookie, records all the paramters for the ad, medium, etc and redirects them to the intended destination.    

### Schema/what it records

We store the data in a flat, simple table.   

    create_table "events", force: true do |t|
	    t.uuid     "network_user_id"  # cross-domain user GUID
	    t.uuid     "domain_user_id"  # domain-specific user GUID
	    t.text     "url"  # the of the hosting page
	    t.string   "app_id" # an unique app id
	    t.string   "ip_address"
	    t.string   "user_id"
	    t.text     "user_agent"
	    t.string   "event_type" 
	    t.string   "event_desc"
	    t.text     "referrer"
	    t.text     "utm_source"  # source (google, etc)
	    t.string   "utm_medium" # ppc/cpa
	    t.string   "utm_campaign"   
	    t.string   "utm_term"  # the keyword of the traffic source
	    t.string   "utm_content"  
	    t.string   "page_urlhost"
	    t.text     "page_path"
	    t.text     "page_query"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.text     "destination_url"
	    t.string   "item_id"  # the id of the item they interacted with
	    t.string   "item_desc" 
	    t.text     "pixel_url"  # the actual url of the request to SA
	  end



# Requirements
Uses ruby 2.0 and Rails 4.

Requires redis and sidekiq for event logging.





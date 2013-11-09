require 'test_helper'

class ConversionsControllerTest < ActionController::TestCase
   test "successfully creates" do
     @request.env["HTTP_REFERER"] = "http://www.example.com/"
     get :create, { 
       app_id: 'test',
       user_id: 12345,
       event_desc: 'test-registration'
     }
     pv = Event.last
     assert_equal("www.example.com", pv.page_urlhost)
     assert_equal("test-registration", pv.event_desc)
     assert_equal("12345", pv.user_id)
   end
end

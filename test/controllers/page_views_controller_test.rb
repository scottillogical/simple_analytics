require 'test_helper'

class PageViewsControllerTest < ActionController::TestCase
   test "the truth" do
     @request.env["HTTP_REFERER"] = "http://www.example.com/"
     get :create, { 
       timestamp: 1377532539012, 
       referrer: '',
       domain_user_id: '17a84e8f-3d68-4d0e-aa99-2833b8f63beb',
       app_id: 'test'}
     pv = Event.last
     assert_equal("www.example.com", pv.page_urlhost)
   end
end

require 'spec_helper'

describe UsersController do
    render_views

  describe "GET 'new_user'" do
    it "should be successful" do
      get 'new_user'
      response.should be_success
    end
  

   it "should have the right title" do
	get 'new_user'
	response.should have_selector("title", :content => "Sign up")
   end
  end

end

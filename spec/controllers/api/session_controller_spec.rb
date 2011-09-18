require 'spec_helper'

describe Api::SessionController do

  it "should log in a valid user" do
    u = Factory(:user)
    post 'create', {:email => u.email, :password => u.password}
    response.should be_success
    assigns(:result).should == 'OK'
  end
end

require 'rack/test'

include Rack::Test::Methods

Given /^that there is a user "([^"]*)" with a password "([^"]*)"$/ do |email, password|
  @user = User.create!(:password => password, :email => email)
end

When /^I log in by the api$/ do
  @params = {:password => @user.password, :email => @user.email}
  @response = post '/api/v1/session/create', @params
end

Then /^I should get back the response "([^"]*)"$/ do |expected_response|
  Nokogiri::XML(@response.body).xpath('/response/result').text.should == expected_response
end

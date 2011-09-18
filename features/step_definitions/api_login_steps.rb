require 'rack/test'

include Rack::Test::Methods

Given /^that there is a user "([^"]*)" with a password "([^"]*)"$/ do |email, password|
  User.create!(:password => password, :email => email)
end

When /^I log in by the api$/ do
  @params = {}
  @headers = {}
  post '/api/v1/session/create', @params
  pending # express the regexp above with the code you wish you had
end

Then /^I should get back "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

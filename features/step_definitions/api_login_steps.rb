require 'rack/test'

include Rack::Test::Methods

Given /^that there is a user "([^"]*)" with a password "([^"]*)"$/ do |name, password|
  User.create!(:name => name, :password => password, :email => "#{name}@#{name}.com")
end

When /^I log in by the api$/ do
  @params = {}
  @headers = {}
  post '/api/v1/login/', @params
  pending # express the regexp above with the code you wish you had
end

Then /^I should get back "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

require 'spec_helper'

describe 'api/session/create.xml.erb' do
  it "should render ok" do
    assign(:result, 'OK')
    render
    assert_select("result", {:text => 'OK'})
  end
end

class Api::SessionController < ApplicationController
  def create
    @result = 'OK'
    # TODO we should have a more DRY way to render this
    render :template => 'api/session/create.xml.builder'
  end
end

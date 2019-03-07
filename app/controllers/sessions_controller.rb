class SessionsController < ApplicationController
  def create
    @omniaut_auth = request.env['omniauth.auth']
  end
end

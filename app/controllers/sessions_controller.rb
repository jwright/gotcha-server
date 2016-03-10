class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    pp auth
    redirect_to ready_bots_path
  end
end

class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    result = Services::StartsSlackBot.for_auth(auth)
    if result.success?
      redirect_to ready_bots_path
    end
  end
end

class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env['omniauth.auth']
    @user = User.find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.name = auth.info.name
    end
    session[:user_id] = @user.id
    redirect_to root_url, notice: "Welcome back, #{@user.name}!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: 'Successfully logged out.'
  end
end

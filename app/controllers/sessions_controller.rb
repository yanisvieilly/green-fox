class SessionsController < ApplicationController
  before_action :prevent_login_display, if: :logged_in?, only: :new

  def create
    auth = request.env['omniauth.auth']
    @user = User.find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.name = auth.info.name
    end
    session[:user_id] = @user.id
    redirect_to root_url, notice: "Welcome back, #{@user.name}!"
  end

  def failure
    redirect_to login_url, alert: "Login error: #{params[:message]}"
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: 'Successfully logged out.'
  end

  private
    def prevent_login_display
      redirect_to root_url, notice: 'You are already logged in.'
    end
end

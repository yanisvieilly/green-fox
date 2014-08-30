class FriendshipsController < ApplicationController
  before_action :require_login

  def index
    @friends = current_user.friends
    @requests = current_user.inverse_requests
  end

  def destroy
    @friend = User.find(params[:id])
    current_user.friends.delete(@friend)
    render nothing: true
  end
end

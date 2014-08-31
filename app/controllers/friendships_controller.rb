class FriendshipsController < ApplicationController
  before_action :require_login

  def index
    @friendships = current_user.friendships.includes(:friend)
    @requests = current_user.inverse_requests
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    head :no_content
  end
end

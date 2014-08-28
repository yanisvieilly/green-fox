class FriendshipsController < ApplicationController
  before_action :require_login

  def index
    @friends = current_user.friends
  end
end

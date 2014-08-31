class UsersController < ApplicationController
  before_action :set_user, only: %i(edit update show)
  before_action :prevent_user_edition, unless: :authorized_user?, only: %i(edit update)

  def edit

  end

  def show

  end

  def update
    if @user.update(user_params)
      redirect_to({ action: :edit }, notice: 'Profile successfully updated!')
    else
      flash.now.alert = 'Profile could not be updated.'
      render :edit
    end
  end

  def search
    friend_ids = current_user.friends.pluck(:id)
    requested_friend_ids = current_user.requests.pluck(:requested_id)
    requester_friend_ids = current_user.inverse_requests.pluck(:requester_id)
    @users = User.where('LOWER(name) LIKE ? OR LOWER(nickname) LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
      .where.not(id: friend_ids | requested_friend_ids | requester_friend_ids | [current_user.id])
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def prevent_user_edition
      redirect_to root_url, alert: 'You are not allowed to edit this profile.'
    end

    def authorized_user?
      current_user == @user
    end

    def user_params
      params.require(:user).permit(:name, :nickname, :location, :description)
    end
end

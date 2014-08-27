class UsersController < ApplicationController
  before_action :set_user, only: %i(edit update)

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to({ action: :edit }, notice: 'Profile successfully updated!')
    else
      render :edit, alert: 'Profile could not be updated.'
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :nickname, :location, :description)
    end
end

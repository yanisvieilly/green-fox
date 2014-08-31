class RequestsController < ApplicationController
  before_action :set_request, only: %i(update destroy)

  def create
    @request = current_user.requests.new(requested_id: params[:requested_id])
    if @request.save
      render json: @request
    else
      render json: { errors: @request.errors.full_messages }, status: 422
    end
  end

  def update
    @request.accept
    head :no_content
  end

  def destroy
    @request.destroy
    head :no_content
  end

  private
    def set_request
      @request = Request.find(params[:id])
    end
end

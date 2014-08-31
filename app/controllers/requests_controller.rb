class RequestsController < ApplicationController
  before_action :set_request, only: %i(update destroy)

  def index
    @requests = current_user.inverse_requests
  end

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
    render json: @request
  end

  def destroy
    @request.destroy
    render json: @request
  end

  private
    def set_request
      @request = Request.find(params[:id])
    end
end

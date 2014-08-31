class RequestsController < ApplicationController
  before_action :set_request, only: %i(update destroy)

  def create
    @request = current_user.requests.create(requested_id: params[:requested_id])
    render nothing: true
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

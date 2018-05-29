class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  helper_method :current_user, :authenticate_user

  def current_user
    User.where(api_key: request.headers["API-KEY"]).first
  end

  def authenticate_user
    if request.headers["API-KEY"].blank?
        render json: "No API key provided", status: 401 and return
    else
        render json: "Provided API key doesn't exist", status: 401 and return if !(User.where(api_key: request.headers["API-KEY"]).exists?)
    end
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  alias_method :devise_current_user, :current_user
  helper_method :authenticate_user

  def current_user
    if params[:api_key].blank?
        devise_current_user
    else
        User.where(api_key: params[:api_key]).first
    end
  end

  def authenticate_user
    if !current_user
        if params[:api_key].blank?
            render json: "No API key provided", status: 401 and return
        else
            render json: "Provided API key doesn't exist", status: 401 and return if !(User.where(api_key: params[:api_key]).exists?)
        end
    end
  end
end

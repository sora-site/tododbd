class ApplicationController < ActionController::Base
  # before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :space_params, unless: :devise_controller?

  private

  # basic認証
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday])
  end

  def space_params
    @spaces = Space.joins(:space_users).where(space_users: { user_id: current_user.id })
  end
end

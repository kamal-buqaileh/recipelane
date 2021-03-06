class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  private

  def after_sign_in_path_for(user)
    user.admin? ? rails_admin_path : root_path
  end
end

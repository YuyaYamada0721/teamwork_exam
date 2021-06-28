class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required

  private

  def login_required
    redirect_to new_session_path unless current_user
  end

  def ensure_current_user
    if logged_in?
      unless current_user.id == params[:id].to_i
        flash[:notice] = '権限がありません'
        redirect_to blogs_path
      end
    else
      redirect_to new_user_path, notice: 'ログインが必要です'
    end
  end
end

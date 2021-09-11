class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create show]
  before_action :ensure_current_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @favorites = current_user.favorites.all
    @favorited_total_counts = Favorite.joins(:blog).where(blogs: { user_id: current_user.id }).count
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

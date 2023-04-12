class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  def distroy
    @user = User.find(params[:id])
    @user.destroy(user_params)
    flash[:notice] = 'ユーザーを削除しました'
    redirect_to :root
  end

  private
  def set_user
    @user = User.find_by(:id => params[:id])
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
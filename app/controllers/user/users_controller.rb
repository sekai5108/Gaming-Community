class User::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def show
    @user = User.find(params[:id])
    @image = 
    @community = Community.new
    @communities = Community.where(user_id: @user.id)
    @account = Account.new
    @accounts = Account.where(user_id: @user.id)
  end

  def index
    @user = current_user
    @users = User.all
    @community = Community.new
    @communities = Community.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = current_user
    if current_user.update(user_params)
      redirect_to user_path(@user),notice: "内容を変更しました！"
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :handle)
  end



end
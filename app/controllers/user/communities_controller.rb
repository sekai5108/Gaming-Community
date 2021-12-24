class User::CommunitiesController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  
  def index
    @user = current_user
    @communities =Community.all
    @community = Community.new
  end

  def show
    @community = Book.new
    @community = Community.find(params[:id])
    @user = @community.user
  end

  def create
    @community = Community.new(community_params)
    @community.user.id = current_user.id
    if @community.save
      flash[:notice] = "投稿に成功しました"
      redirect_to community_path(@community)
    else
      @user = current_user
      @communities = Community.all
      redirect_to referer
    end
  end

  def edit
    @community = Community.find(params[:id])
    if @community.user.== current_user
      redirect_to edit_community_path
    else
      redirect_to communities_path
    end
  end

  def update
    @community = Community.find(params[:id])
    @community.user_id = current_user.id
    if @community.update(community_params)
      flash[:notice] = "更新が成功しました"
      redirect_to community_path(@community)
    else
      render :edit
    end
  end

  def destroy
    @community = Community.find(params[:id])
    if @community.destroy
      redirect_to communities_path
    end
  end

  private
  def community_params
    params.require(:community).permit(:title, :text)
  end

end

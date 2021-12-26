class User::CommunitiesController < ApplicationController
  before_action :authenticate_user!, except:[:index]

  def new
    @community = Community.new
  end


  def index
    @user = current_user
    @communities = Community.all
    @community = Community.new
    if user_signed_in?
      @accounts = Account.where(user_id: @user.id)
    end
  end

  def show
    @community = Community.new
    @community = Community.find(params[:id])
    @comment = CommunityComment.new
    @comments = CommunityComment.all
    @user = @community.user
    if user_signed_in?
      @accounts = Account.where(user_id: @user.id)
    end
  end

  def create
    @community = Community.new(community_params)
    @community.user_id = current_user.id
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
      redirect_to root_path
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
      redirect_to root_path
    end
  end

  private
  def community_params
    params.permit(:title, :text)
  end

end

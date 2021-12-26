class User::CommunityCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @community = Community.find(params[:community_id])
    @community_comment = CommunityComment.new(community_comment_params)
    @community_comment.user_id = current_user.id
    @community_comment.community_id = @community.id
    @community_comment.save
    redirect_to community_path(@community)
  end

  def edit
  end

  def update
  end

  def destroy
    @community_comment.find_by(id: params[:id]).destroy
    redirect_to community_path(params[:community_id])
  end

  private
  def community_comment_params
    params.require(:community_comment).permit(:comment)
  end

end

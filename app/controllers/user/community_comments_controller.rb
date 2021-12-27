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
    @community= Community.find(params[:community_id])
    community_comment = @community.community_comments.find(params[:id])
    community_comment.destroy
    redirect_to community_path(params[:community_id])
  end

  private
  def community_comment_params
    params.require(:community_comment).permit(:comment)
  end

end

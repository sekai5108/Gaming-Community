class User::CommunityCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def creat
    community = Community.find(parans[:community_id])
    comment = current_user.comments.new(comment_params)
    comment.community_comment_id = community.id
    comment.save
    redirect_to community_path
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to community_path(params[:community_id])
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end

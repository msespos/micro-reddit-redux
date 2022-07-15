class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def vote
    @vote = Vote.new(vote_params)
    @vote.user_id = current_user.id
    if @vote.save
      flash[:notice] = 'You voted on a post!'
      redirect_to posts_path
    else
      flash[:alert] = 'Error - could not process vote'
      render 'new'
    end
  end

  private

    def vote_params
      params.require(:vote).permit(:upvote, :user_id, :post_id,)
    end
end

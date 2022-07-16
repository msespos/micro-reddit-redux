class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = 'Post created!'
      redirect_to posts_path
    else
      flash[:alert] = 'Error - could not process post creation'
      render 'new'
    end
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

  def comment
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = 'You commented on a post!'
      redirect_to posts_path
    else
      flash[:alert] = 'Error - could not process comment'
      render 'new'
    end
  end

  private

    def post_params
      params.require(:post).permit(:link, :caption)
    end

    def vote_params
      params.require(:vote).permit(:upvote, :user_id, :post_id,)
    end

    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end
end

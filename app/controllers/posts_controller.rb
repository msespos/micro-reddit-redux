class PostsController < ApplicationController
  def index
    if params[:sort] == 'hot'
      @posts = Post.posts_by_hotness
    elsif params[:sort] == 'new'
      @posts = Post.all.reverse
    else
      @posts = Post.posts_by_score
    end
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
    if Post.already_voted(current_user, vote_params[:post_id])
      flash[:alert] = "You can't vote more than once for a post!"
      redirect_to posts_path
    elsif @vote.save
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

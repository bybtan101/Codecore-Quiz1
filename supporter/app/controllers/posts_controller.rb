class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.most_recent
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
  end

  def edit    
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      flash[:alert] = "Failed to update, please try again"
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Ticket deleted"
  end

  private

  def find_post
    @post = Post.find params[:id]
  end

  def post_params 
    params.require(:post).
                    permit(:name, :email, 
                            :department, :message)
  end

end
class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  
  end


  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
    redirect_to posts_url
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    # render :posts_url
    redirect_to posts_path
  end
    
 



  private

  def post_params
    params.require(:post).permit(:message, images: [])
  end

  
end

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to "posts/"
    else
      render "new"
    end #end for if
  end# end for create

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to 'posts/'
  end

  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      redirect_to posts_path
    else
      render "edit"
    end #end for if
  end# end for update

  private
  def post_params
      params.require(:post).permit(:title, :body)
  end
end # end for class

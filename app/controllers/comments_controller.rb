class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to post_path(@comment.post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def edit
      @post = Post.find(params[:post_id])
      @comment = Comment.find.edit(comment_params)
      @comment.edit = current_user
      @comment.save
      redirect_to post_path(@post)
    end
    def update
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:id])
      @comment.update
      if @comment.update_attributes(params.require(:comment).permit(:body))
        redirect_to post_path(@post)
      else
        render "edit"
      end #end for if
    end# end for update

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end # end for class

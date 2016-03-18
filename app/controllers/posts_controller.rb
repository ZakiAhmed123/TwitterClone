class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new params.require(:post).permit(:text, :user_id, :view_count)
    @post.user=@current_user
    if @post.save
      redirect_to timeline_path(id: @current_user.id)
    else
      render :new
    end
  end


  def delete
  end

end

class UsersController < ApplicationController

  def new
    @user=User.new
  end

  def create
 @user = User.new params.require(:user).permit(:email, :password, :name, :user_name, :photo)
 if @user.save
   session[:user_id] = @user.id
  redirect_to timeline_path(id: @user.id)
else
   flash.now[:alert] = "Something is wrong with your email or password"
  render:new
  end
end

def show
  @user_profile=User.find_by id: params[:id]
  @posts=Post.all
end

  def timeline
    @post=Post.new
    @user= User.find_by id: params[:id]
    @current_user = User.find_by id: session[:user_id]
    if @current_user && @current_user.following_users.present?
        follower_ids = @current_user.following_users.pluck(:id)
        all_ids = follower_ids << @current_user.id
        @posts = Post.where(user_id: all_ids).order("created_at DESC")
      else
        @posts = Post.all.order("created_at desc")
      end
  end


  def index
    @users=User.where("id !=?", @current_user.id)
    @people = @current_user.following_users
  end
def new_post
  @post = Post.new
end

def create_post
  @post = Post.new params.require(:post).permit(:text, :user_id, :view_count)
  @post.user=@current_user
  if @post.save
    redirect_to timeline_path(id: @current_user.id)
  else
    render :new
  end
end

end

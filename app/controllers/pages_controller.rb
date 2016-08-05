class PagesController < ApplicationController
  def index
  end


  def new
    @post = Post.new
  end

  def home
    @posts = Post.all
  end


  def profile
    @post = Post.new(post_params)
    if(User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to root_path, :notice => "User not found!"
    end  
    @post = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
    
  end

  def explore
    @posts = Post.all
  end

  def settings
  end

  def friends
  end

  
private
  def post_params
    params.require(:post).permit(:user_id, :content)
  end
end

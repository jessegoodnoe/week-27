class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]

  def index
    render :locals => { :posts => current_user.posts }
  end

  def show
  end

  def create
    post = Post.create(params[:post].merge(:user => current_user))
    redirect_to posts_path
  end

end

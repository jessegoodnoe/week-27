class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]

  def index
    render :locals => { :posts => current_user.posts }
  end

  def show
  end

  def create
    post = Post.create(params[:post].merge(:user => current_user))


    if post.twitter
      logger.info "put twitttteerr on queue"
      Resque.enqueue(Poster,{ :user_id => current_user.id, :post_id => post.id })
      logger.info "twiterrer queued."
      # current_user.twitter.update post.message
    end

    # if post.facebook
    #   current_user.facebook.put_wall_post post.message
    # end

    redirect_to posts_path
  end

end

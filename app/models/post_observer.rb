class PostObserver < ActiveRecord::Observer
  observe :post
  
  def after_create(post)
    Resque.enqueue(Poster, post.id)
  end
end

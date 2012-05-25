require 'logger'

class FacebookPoster
  @queue = :facebook_poster

  def self.perform(post_id)
    post = Post.find post_id

    if post and post.facebook
      log.info("POSTED to the Facebooks at #{Time.now}")
      # post.user.facebook.update post.message
    end
  end

  def self.log
    @@logger ||= Logger.new(File.join(File.dirname(__FILE__), "..","..","poster.log"))
  end


end
require 'logger'

class TwitterPoster
  @queue = :twitter_poster

  def self.perform(post_id)
    post = Post.find post_id

    if post and post.twitter
      log.info("POSTED to the Twitters at #{Time.now}")
      # post.user.twitter.update post.message
    end
  end

  def self.log
    @@logger ||= Logger.new(File.join(File.dirname(__FILE__), "..","..","poster.log"))
  end


end
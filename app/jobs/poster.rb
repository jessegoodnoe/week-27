require 'logger'

class Poster
  @queue = :poster

  class << self

    def perform(options = {})

log.info "options: " + options.inspect
      sleep 5

      log.info "Posting to twitter #{Time.now}"
      user = User.find(options["user_id"].to_i)
      post = Post.find(options["post_id"].to_i)
      user.twitter.update post.message
      log.info "Posted to twitter #{Time.now}"
      # current_user.twitter.update post.message

    end

    def log
      @@logger ||= Logger.new(File.join(File.dirname(__FILE__), "..","..","poster.log"))
    end

  end


end
require 'logger'

class Poster
  @queue = :poster

  class << self

    def perform(post_id)
      Resque.enqueue(TwitterPoster, post_id)    
      Resque.enqueue(FacebookPoster, post_id)    
    end

    def log
      @@logger ||= Logger.new(File.join(File.dirname(__FILE__), "..","..","poster.log"))
    end

  end


end
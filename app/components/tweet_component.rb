class TweetComponent < ViewComponent::Base
  def initialize(tweet:, frontpage:, tweet_counter: 0)
    @tweet = tweet
    @frontpage = frontpage
    @counter = tweet_counter
  end

  def mega?
    return false unless @frontpage
    @counter <= 10
  end

  def top?
    return false unless @frontpage
    @counter <= 20
  end

  def container_class
    if @tweet.media.size > 1 || !top?
      'w-full py-10'
    else
      'sm:w-1/2 py-12'
    end
  end

  def media_class
    height = if top?
      'h-48'
    else
      'h-24'
    end

    width = case @tweet.media.size
    when 1
      if top?
        'w-full'
      else
        'w-1/2'
      end
    when 2
      'w-1/2'
    else
      'w-1/3'
    end

    "#{height} #{width}"
  end

  def url
    if @tweet.urls.count == 1
      @tweet.urls.first.expanded_url.to_s
    else
      @tweet.url.to_s
    end
  end

  def text_class
    if @tweet.media?
      'text-sm'
    elsif mega?
      'text-xl font-medium'
    elsif top?
      'text-lg'
    else
      'text-base'
    end
  end

  def text
    if @tweet.media?
      @tweet.full_text
    else
      @tweet.full_text.gsub(/(\n)+/, '<br>').html_safe
    end
  end

end

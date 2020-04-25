module DailyDigestsHelper

  def tweet_class(tweet, index)
    if tweet.media.size > 1 || index > 20
      'w-full py-10'
    else
      'sm:w-1/2 py-12'
    end
  end

  def tweet_media_class(tweet, index)
    height = if index > 20
      'h-24'
    else
      'h-48'
    end

    width = case tweet.media.size
    when 1
      if index > 20
        'w-1/2'
      else
        'w-full'
      end
    when 2
      'w-1/2'
    else
      'w-1/3'
    end

    "#{height} #{width}"
  end

  def tweet_text_class(tweet, index)
    if tweet.media?
      'text-sm'
    elsif index <= 10
      'text-xl font-medium'
    elsif index <= 20
      'text-lg'
    else
      'text-base'
    end
  end

  def tweet_text(tweet)
    if tweet.media?
      tweet.full_text
    else
      tweet.full_text.gsub(/(\n)+/, '<br>').html_safe
    end
  end

end

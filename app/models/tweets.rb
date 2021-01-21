class Tweets

  def initialize(tweets)
    @tweets = tweets
  end

  def limit(value)
    @limit = value
    self
  end

  def offset(value)
    @offset = value
    self
  end

  def unscope(value)
    Tweets.new(@tweets)
  end

  def count
    @tweets.count
  end

  def take(val)
    @tweets.take(val)
  end

  def to_ary
    from = @offset
    to = @offset + @limit
    @tweets[from..to]
  end

end

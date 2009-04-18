class TwitterAccount < Account

  def get_content(account, tweet_count)
      @tweets = Twitter::Client.new.timeline_for :user, :id => account.username, :count => tweet_count
      @tweets.each do |tweet|
        @item = Item.new()
        @item.service = "twitter"
        @item.content = tweet.text
        @item.created_at = tweet.created_at
        @item.user_id = account.user_id
        @item.save() if Item.find_by_content(tweet.text).nil?
      end
  end

end

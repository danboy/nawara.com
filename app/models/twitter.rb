class Twitter < Account

  def get_content
      @tweets = Twitter::Client.new.timeline_for :user, :id => account.login, :count => 10
      @tweets.each do |tweet|
        @item = Item.new()
        @item.service = "twitter"
        @item.content = tweet.text
        @item.created_at = tweet.created_at
        @item.save()
      end
  end

end

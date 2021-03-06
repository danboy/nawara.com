class RssAccount < Account

  def get_content(account, item_count)

      open(account.url) do |http|

        response = http.read
        result = RSS::Parser.parse(response, false)
unless result.nil?
          result.items.each do |item|
            @item = Item.new()
            @item.service = "rss"
            @item.content = item.description
            @item.created_at = item.date.to_date
            @item.user_id = account.user_id
            @item.save() if Item.find_by_content(item.description).nil?
          end
end
      end

  end

end

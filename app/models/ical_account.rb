class RssAccount < Account

  def get_content(account, item_count)

        # Open a file or pass a string to the parser
  cal_file = File.open(account.url)

  # Parser returns an array of calendars because a single file
  # can have multiple calendars.
  cals = Icalendar.parse(cal_file)
  cal = cals.first

  # Now you can access the cal object in just the same way I created it
  event = cal.events.first

  puts "start date-time: " + event.dtstart
  puts "summary: " + event.summary

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

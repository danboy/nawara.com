class IcalAccount < Account

  def get_content(account, item_count)
    open(account.url) do |http|
    # Open a file or pass a string to the parser
    cal_file = http.read

    # Parser returns an array of calendars because a single file
    # can have multiple calendars.
    cals = Icalendar.parse(cal_file)
    cal = cals.first
      unless cal.events.nil?
        cal.events.each do |event|
          @item = Item.new()
          @item.service = "ical"
          @item.content = event.summary
          @item.created_at = event.dtstart.to_date
          @item.user_id = account.user_id
          @item.save() if Item.find_by_content(event.summary).nil?
        end
      end
  end
  end

end

class Facebook < Account

  def get_content
    @accounts = Account.all
  end

end

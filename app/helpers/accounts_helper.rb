module AccountsHelper
  def update_accounts
    @accounts = Account.all
    @accounts.each do |account|
      account.get_content
    end
  end
end

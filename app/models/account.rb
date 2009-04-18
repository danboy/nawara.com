class Account < ActiveRecord::Base
  belongs_to :user

  def get_content
    raise "get_content must be implemented on this account type"
  end

end

class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar,
                    :styles => { :medium => "100x100>",
                                 :thumb => "58x58>" },
                    :default_url => "/images/missing.png"
end

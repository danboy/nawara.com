class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar,
                    :default_url => "/images/missing.png",
                    :styles => { :medium => "100x100>",
                                 :thumb => "58x58>" }
end

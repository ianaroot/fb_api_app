class Friend < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :gender, :fbid, :avatar_url
  validates :fbid, uniqueness: true
end
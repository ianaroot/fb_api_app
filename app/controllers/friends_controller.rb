class FriendsController < ApplicationController

  def create
    Friend.create(params[:friend])
  end

end
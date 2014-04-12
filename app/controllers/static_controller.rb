class StaticController < ApplicationController


def index
  gender = params[:gender]
  if default_user
    @friends = get_friends('ian.root.75', FB, gender)
  else
    user_id = params[:user_id]
    user_token = params[:user_token]
    new_fb = Koala::Facebook::API.new(user_token)
    @friends = get_friends(user_id, new_fb, gender)
  end
    @friend = Friend.new
end


end

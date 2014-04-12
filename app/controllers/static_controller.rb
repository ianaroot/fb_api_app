class StaticController < ApplicationController


def index
  gender = params[:gender]
  if default_user
    @friends = get_friends('ian.root.75', FB, gender)
  else
    user_token = params[:user_token]
    new_fb = Koala::Facebook::API.new(user_token)
    user_id = new_fb.get_object('me')["id"]
    @friends = get_friends(user_id, new_fb, gender)
  end
    @friend = Friend.new
end


end

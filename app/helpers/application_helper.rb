module ApplicationHelper

  def get_friends(fb_user, fb, gender = nil)
    friends = fb.get_connections(fb_user, "friends")
    friends.map! do |friend|
      id = friend["id"]
      friend = fb.get_object(id).merge({"avatar_url"=>fb.get_picture(id)})
      unless gender_unspecified?(gender)
        if friend["gender"] != gender
          friend = nil
        end
      end
      friend
    end
    friends.compact!
    friends[0..99]
  end

  def default_user
    params[:user_id] == nil || params[:user_token] == nil || params[:user_token] == "" || params[:user_id] == ""
  end

  def gender_unspecified?(gender)
    gender == "" || gender == nil
  end

end

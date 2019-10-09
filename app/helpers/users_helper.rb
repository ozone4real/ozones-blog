module UsersHelper
  def gravatar_for(user, size = "")
    gravatar_id = Digest::MD5.hexdigest(user.email)
    gravatar_url = user.image_url.to_s.empty? ? "https://secure.gravatar.com/avatar/#{gravatar_id}" : user.image_url.to_s
    image_tag(gravatar_url, alt: user.username, class: "profile-img#{size}")
  end

  def check_following(user, action1, action2 = "")
    current_user.is_following?(user) ? action1 : action2
  end

  def show_following_badge
    if @you_follow_each_other
      "you follow each other"
    elsif @follows_you
      "follows you"
    end
  end
end

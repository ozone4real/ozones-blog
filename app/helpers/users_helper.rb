module UsersHelper
  def gravatar_for(user, size='')
    gravatar_id = Digest::MD5::hexdigest(user.email)
    gravatar_url = user.image_url.to_s.empty? ? "https://secure.gravatar.com/avatar/#{gravatar_id}" : user.image_url.to_s
    image_tag(gravatar_url, alt: user.username, class:"profile-img#{size} rounded-circle")  
  end
end

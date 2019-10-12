class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def liked_by(user)
    likes.find_by(user: user)
  end
end

class User < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  has_many :articles, dependent: :destroy
  has_many :likes
  has_many :active_relationships, class_name: "Follower", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Follower", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships
  before_save {self.email = email.downcase}
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[A-Za-z0-9][\w.-][a-zA-Z0-9]+@(\w{2,}\.){1,2}[a-z]{2,20}\z/ }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([a-zA-Z0-9][\w-]+[a-zA-Z0-9]){1,}\z/}
  validates :full_name, allow_nil: true, format: { with: /[a-zA-Z-]+( [a-zA-Z-]+){1,2}/ }
  has_secure_password

  def follow(user)
    following << user
  end

  def unfollow(user)
    following.delete(user)
  end

  def is_following?(user)
    following.include?(user)
  end

  def follow_each_other?(user)
    following.include?(user) && followers.include?(user)
  end

  def follows_you?(user)
    followers.include?(user)
  end
end

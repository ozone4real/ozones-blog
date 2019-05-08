class User < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  has_many :articles, dependent: :destroy
  has_many :likes
  before_save {self.email = email.downcase}
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[A-Za-z0-9][\w.-][a-zA-Z0-9]+@(\w{2,}\.){1,2}[a-z]{2,20}\z/ }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([a-zA-Z0-9][\w-]+[a-zA-Z0-9]){1,}\z/}
  has_secure_password
end

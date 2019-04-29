class Article < ApplicationRecord
  belongs_to :user
  mount_uploader :image_url, ImageUploader
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :article_body, presence: true, length: { minimum: 10, maximum: 8000 }
end
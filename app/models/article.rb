class Article < ActiveRecord::Base
  mount_uploader :image_url, ImageUploader
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 800 }
end

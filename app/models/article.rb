class Article < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :article_categories
  has_many :categories, through: :article_categories
  mount_uploader :image_url, ImageUploader
  after_create :generate_unique_slug
  validates :title, presence: true, length: { minimum: 3, maximum: 70 }
  validates :article_body, presence: true, length: { minimum: 10, maximum: 20000 }

  private

  def generate_unique_slug
    slug = "#{title.tr ' .', '-'}-#{id}".downcase
    update(slug: slug)
  end
end

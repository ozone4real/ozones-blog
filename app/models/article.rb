class Article < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :article_body, presence: true, length: { minimum: 10, maximum: 20_000 }
  after_create :generate_unique_slug
  searchkick suggest: [:full_text]

  private

  def search_data
    { title: title, article_body: article_body }.merge(
      username: user(&:username)
    )
  end

  def generate_unique_slug
    slug = "#{title.parameterize}-#{id}"
    update(slug: slug)
  end
end

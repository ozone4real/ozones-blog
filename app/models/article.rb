class Article < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  belongs_to :user
  has_many :article_stats, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :article_body, presence: true, length: { minimum: 10, maximum: 20_000 }
  after_create :generate_unique_slug
  searchkick suggest: [:title]
  scope :search_import, -> { includes(:user) }

  private

  def search_data
    { title: title, number_of_reads: number_of_reads, article_body: article_body, username: user.username }
  end

  def generate_unique_slug
    slug = "#{title.parameterize}-#{id}"
    update(slug: slug)
  end
end

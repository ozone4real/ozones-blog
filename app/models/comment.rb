class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :likes, class_name: 'CommentReaction', foreign_key: 'comment_id', dependent: :destroy
  belongs_to :commenter, class_name: "User", foreign_key: 'user_id'
  validates_presence_of :body, on: %i[create update], message: "can't be blank"
  validates_length_of :body, within: 2..5000, message: "must be within 5000 characters"
end

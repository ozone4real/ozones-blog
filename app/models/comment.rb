class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  belongs_to :commenter, class_name: "User", foreign_key: 'user_id'
end

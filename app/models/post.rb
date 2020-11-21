class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  validates :title, presence: true
  validates :content, presence: true
  validates :user, presence: true
end
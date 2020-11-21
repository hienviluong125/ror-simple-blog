class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  mount_uploader :thumbnail, ThumbnailUploader

  validates :title, presence: true
  validates :content, presence: true
  validates :user, presence: true
  validates :thumbnail, presence: true
  validates :description, presence: true
end

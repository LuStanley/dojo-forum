class Article < ApplicationRecord
  mount_uploader :image, PhotoUploader
  has_many :comments
end

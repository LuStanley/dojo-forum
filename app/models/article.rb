class Article < ApplicationRecord
  mount_uploader :image, PhotoUploader
end

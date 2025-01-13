class PostImage < ApplicationRecord

  # PostImageモデルにimageを持たせる
  has_one_attached :image
end

class PostImage < ApplicationRecord

  # PostImageモデルにimageを持たせる
  has_one_attached :image
  belongs_to :user
end

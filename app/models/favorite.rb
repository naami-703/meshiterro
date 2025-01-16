class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :post_image

  # １つのコメントに対しいいねを重複できない状態に制限
  validates :user_id, uniqueness: {scope: :post_image_id}
end

class PostImage < ApplicationRecord

 # PostImageモデルにimageを持たせる
  has_one_attached :image
  belongs_to :user
  # PostImageモデルにPostCommentモデルを関連付ける
  has_many :post_comments, dependent: :destroy
  # PostImageモデルにfavoriteモデルを関連付け
  has_many :favorites, dependent: :destroy
  # shop_name、imageのバリデーションチェック
  validates :shop_name, presence: true
  validates :image, presence: true

  # 画像が添付されていない場合、デフォルト画像を設定するメソッド
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  # ユーザーがお気に入り登録しているかを確認するメソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end

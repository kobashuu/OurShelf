class Book < ApplicationRecord
  belongs_to :user
  has_many :notifications, dependent: :destroy
  validates :user_id, presence: true
  validates :title, presence: true
  validates :author, presence: true
  validates :picture, presence: true
  validate  :picture_size

  private

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "データが大きすぎます")
      end
    end
end

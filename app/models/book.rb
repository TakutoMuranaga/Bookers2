class Book < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  
  #titleが存在しているかを確認するバリデーション
  validates :title, presence: true
  #bodyが存在しているかを確認するバリデーション,最大２００文字
  validates :body, presence: true, length: {maximum: 200 }
  
   def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
   end
  
end

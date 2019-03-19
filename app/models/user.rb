class User < ApplicationRecord
  validates :name, presence: true,
             length:{ maximum: 30 }
  validates :email, presence: true,
             format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, # 半角英数字をそれぞれ1種類以上含む8文字以上35文字以下
             format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i},
             length:{ minimum: 8, maximum: 32 }
  validates :password_confirmation, presence: true,
             format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i},
             length:{ minimum: 8, maximum: 32 }

  has_secure_password #パスワードの実装

  has_many :topics, dependent: :destroy
end

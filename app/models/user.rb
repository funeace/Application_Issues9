class User < ApplicationRecord

  # ユーザ名が2文字〜20文字の制限(length)、空白じゃない(presence: true)
  validates :name, length: { in: 2..20 }, presence: true

  # 自己紹介文が最大50文字
  validates :introduction, length: {maximum: 50}

  #refileを使うときの設定。このモデルのattachmentがきたら、profile_image_id を見に行くってこと。多分
  attachment :profile_image

  #bookモデルと1:多の関係を作る（has_manyが1のほうで、 belongs_toが多のほう）
  has_many :books, dependent: :destroy

  has_many :user_rooms, dependent: :destroy

  # こいつを見ていけば内容がわかる？
  has_many :relations, through: :user_rooms,source: :room

  has_many :chats, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

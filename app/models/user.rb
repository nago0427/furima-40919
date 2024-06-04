class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password,  format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}ー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}ー－]+\z/ }
  validates :birth_date, presence: true

  has_many :items

end

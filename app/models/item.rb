class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1}
  validates :condition_id, presence: true, numericality: { other_than: 1}
  validates :shipping_fee_id, presence: true, numericality: { other_than: 1}
  validates :prefecture_id, presence: true, numericality: { other_than: 1}
  validates :shipping_day_id, presence: true, numericality: { other_than: 1}
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day

end

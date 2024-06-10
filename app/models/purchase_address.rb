class PurchaseAaddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id

  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number


  validates :user_id, :item_id, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id, :city, :address, :phone_number, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(
      postal_code: postal_code, prefecture_id: prefecture_id, city: city,
      address: address, building: building, phone_number: phone_number,
      purchase_id: purchase.id
    )
  end

end


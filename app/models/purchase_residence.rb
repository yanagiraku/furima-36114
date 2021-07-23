class PurchaseResidence
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :purchase_id




  validates :delivery_id,  numericality: { other_than: 1 }

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :purchase_id
    validates :postal_code,  format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end


  def save
    # 寄付情報を保存し、変数donationに代入する
    purchase = Purchase.create( user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Residence.create(postal_code: postal_code, delivery_id: delivery_id, municipality: municipality, adress: adress, building_name: building_name, purchase_id: purchase.id)
  end

end
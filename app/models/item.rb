class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase


  validates :item_name,        presence: true
  validates :category_id,      presence: true
  validates :item_description, presence: true
  validates :status_id,        presence: true
  validates :burden_id,        presence: true
  validates :delivery_id,      presence: true
  validates :day_delivery_id,  presence: true
  validates :price,            presence: true

end

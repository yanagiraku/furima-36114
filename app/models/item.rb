class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  validates :item_name,        length:{ maximum: 40 }
  validates :price,            numericality: { only_integer: true, in: 300..9999999 }

  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :price
  end

  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :delivery_id
    validates :day_delivery_id
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :delivery
  belongs_to :day_delivery
end

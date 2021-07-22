class Residence < ApplicationRecord
  belongs_to :purchase
  belongs_to_active_hash :delivery

  validates :delivery_id,  numericality: { other_than: 1 }


  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
    validates :phone_number
  end

end

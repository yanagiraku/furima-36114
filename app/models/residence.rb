class Residence < ApplicationRecord
  belongs_to :purchase
  belongs_to_active_hash :delivery


end

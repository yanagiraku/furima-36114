class Residence < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery


end
class Payment < ApplicationRecord
  belongs_to :order,foreign_key: "orders_id"
  monetize :sub_total_cents, allow_nil: true
  monetize :discount_cents, allow_nil: true
  monetize :total_amount_cents, allow_nil: true
end

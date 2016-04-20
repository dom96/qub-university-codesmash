class Sale < ActiveRecord::Base
  serialize :items

  validates :total, presence: true
  validates :items, presence: true

  # This is purely for teaching purposes, this is normally undesirable
  def save(*args)
    save!(*args)
  end

  def self.create(*args)
    create!(*args)
  end

  # Calculates the price of the specified item (hashmap). The calculation takes
  # any discounts into account.
  def self.calcPrice(item)
    total = item["price"].to_f
    if item.key? "discount"
      total -= item["discount"]["amount"].to_f
    end
    total
  end
end

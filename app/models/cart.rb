# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items 

  def add_product(product_args)
    current_item = line_items.find_by(product_id: product_args[:product_id])
    # puts current_item.inspect
    # puts product_args
    # puts product_args[:quantity]
    if current_item
      current_item.quantity += product_args[:quantity].to_i
      current_item.save
    else
      current_item = line_items.build(product_args)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  
end

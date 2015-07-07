class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  belongs_to :user

  cattr_accessor :form_steps do
    %w(personal payment preview)
  end

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
  
  # validates :name, :owner_name, presence: true, if: -> { required_for_step?(:identity) }
  # validates :identifying_characteristics, :colour, presence: true, if: -> { required_for_step?(:characteristics) }
  # validates :special_instructions, presence: true, if: -> { required_for_step?(:instructions) }

  # def required_for_step?(step)
  #   return true if form_step.nil?
  #   return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
  # end

end

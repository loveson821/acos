# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  price      :integer
#  shop_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string(255)
#

class Product < ActiveRecord::Base
  include Filterable
  # scope :price, -> (location_id) { where location_id: location_id }
  scope :contains, -> (name) { where("name like ?", "%#{name}%")}

  paginates_per 12
  mount_uploader :image, ImageUploader

  belongs_to :shop
  has_many :line_items
  has_many :orders, :through => :line_items

  before_destroy :ensure_not_reference_by_any_line_item

  private
  def ensure_not_reference_by_any_line_item
    if line_items.isEmpty?
      return true
    else
      errors.add(:base, 'line items present')
      return false
    end
  end
end

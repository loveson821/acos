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

  paginates_per 10
  mount_uploader :image, ImageUploader

  belongs_to :shop
end

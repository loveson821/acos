# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  phone      :string(255)
#  address    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Profile < ActiveRecord::Base
  belongs_to :user
end

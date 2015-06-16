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

FactoryGirl.define do
  factory :profile do
    phone "MyString"
address "MyString"
  end

end

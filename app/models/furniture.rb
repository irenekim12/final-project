# == Schema Information
#
# Table name: furnitures
#
#  id            :integer          not null, primary key
#  asking_price  :float
#  category      :string
#  image         :string
#  item_details  :text
#  location      :string
#  name          :string
#  notes         :text
#  purchase_date :datetime
#  retail_price  :float
#  retailer      :string
#  sell_by       :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  owner_id      :integer
#

class Furniture < ApplicationRecord
end

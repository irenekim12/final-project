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
#  purchase_date :date
#  retail_price  :float
#  retailer      :string
#  sell_by       :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  owner_id      :integer
#

class Furniture < ApplicationRecord

belongs_to :owner, :class_name => "User"
has_many :comments, :dependent => :destroy
has_many :bookmarks, :dependent => :destroy

validates :owner_id, :presence => true
validates :image, :presence => true


def extract_bookmark(user_id)
  return Bookmark.where(:furniture_id => self.id, :user_id => user_id).at(0).id
end

end

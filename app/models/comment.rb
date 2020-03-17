# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :integer
#  furniture_id :integer
#

class Comment < ApplicationRecord

belongs_to :author, :class_name => "User"
belongs_to :furniture

end

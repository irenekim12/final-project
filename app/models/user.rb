# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many :furnitures, :foreign_key => "owner_id", :dependent => :destroy
  has_many :comments, :foreign_key => "author_id", :dependent => :destroy
  has_many :bookmarks, :dependent => :destroy

  validates :username, :presence => true
  validates :username, :uniqueness => true
end

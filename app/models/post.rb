class Post < ActiveRecord::Base
  validates :name,  :presence => true
  validates :title, :presence => true,
    :length => { :minimum => 5 }
  has_many :comments, :dependent => :destroy

  has_many :tags
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

end
# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#


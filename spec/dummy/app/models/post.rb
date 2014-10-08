class Post < ActiveRecord::Base

  belongs_to :user
  has_many :post_tags, :dependent => :destroy
  has_many :tags, :through => :post_tags, :sortable => true

end

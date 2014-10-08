class User < ActiveRecord::Base

  has_many :posts
  has_many :sorted_posts, :class_name => 'Post', :sortable => true
  has_many :user_posts, :class_name => 'Post', :sortable => true, :sortable_field => 'user_position'

end

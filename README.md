Activerecord sortable
=====================
# Installation
```
gem install activerecord_sortable
```

# Usage
Add `sortable` option to relation. Table should contain column `position` or you can define column name.
```ruby
# has many
has_many :posts, :sortable => true
has_many :user_posts, :class_name => 'Post', :sortable => true, :sortable_field => 'user_position'

# many to many
has_many :tags, :through => :post_tags, :sortable => true
```

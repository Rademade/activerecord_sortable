require 'spec_helper'

describe 'Has many association' do

  describe '.writer' do

    describe 'when relation is one to many' do

      let(:user) do
        User.create
      end

      let(:post1) do
        Post.create :title => 'Post1'
      end

      let(:post2) do
        Post.create :title => 'Post2'
      end

      it 'should save position' do
        user.sorted_posts = [post2, post1]
        user.save
        expect(post2.position).to eq(1)
      end

    end

    describe 'when relation is many to many' do

      let(:post) do
        Post.create
      end

      let(:tag1) do
        Tag.create :name => 'Tag1'
      end

      let(:tag2) do
        Tag.create :name => 'Tag2'
      end

      it 'should save position' do
        post.tags = [tag2, tag1]
        post.save
        expect(PostTag.find_by(:post => post, :tag => tag2).position).to eq(1)
      end

    end

  end

end
require 'spec_helper'

describe 'Association relation' do

  describe '.to_a' do

    describe 'when relation is one to many' do

      let(:post1) do
        Post.create :title => 'Post1'
      end

      let(:post2) do
        Post.create :title => 'Post2'
      end

      let(:post3) do
        Post.create :title => 'Post3'
      end

      let(:posts) do
        [post2, post1, post3]
      end

      let(:user) do
        User.create({ :sorted_posts => posts })
      end

      describe 'when order was not used' do

        it 'should sort' do
          expect(user.sorted_posts).to eq(posts)
        end

      end

      describe 'when order was used' do

        it 'should not sort' do
          expect(user.sorted_posts.order(:title => :asc)).to eq([post1, post2, post3])
        end

      end

    end

    describe 'when relation is many to many' do

      let(:tag1) do
        Tag.create :name => 'Tag1'
      end

      let(:tag2) do
        Tag.create :name => 'Tag2'
      end

      let(:tag3) do
        Tag.create :name => 'Tag3'
      end

      let(:tags) do
        [tag2, tag1, tag3]
      end

      let(:post) do
        Post.create({ :tags => tags })
      end

      describe 'when order was not used' do

        it 'should sort' do
          expect(post.tags).to eq(tags)
        end

      end

      describe 'when order was used' do

        it 'should not sort' do
          expect(post.tags.order(:name => :asc)).to eq([tag1, tag2, tag3])
        end

      end

    end

  end

end
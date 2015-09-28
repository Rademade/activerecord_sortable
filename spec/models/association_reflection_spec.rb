require 'spec_helper'

describe 'Association reflection' do

  let(:post_reflection) do
    User.reflections['posts']
  end

  let(:user_post_reflection) do
    User.reflections['user_posts']
  end

  let(:sorted_post_reflection) do
    User.reflections['sorted_posts']
  end

  describe '.sortable?' do

    describe 'when was set' do

      it 'should be sortable' do
        expect(user_post_reflection.sortable?).to be
      end

    end

    describe 'when was not set' do

      it 'should not be sortable' do
        expect(post_reflection.sortable?).not_to be
      end

    end

  end

  describe '.sortable_field' do

    describe 'when was set' do

      it 'should equals set value' do
        expect(user_post_reflection.sortable_field).to eq(:user_position)
      end

    end

    describe 'when was not set' do
    
      it 'should equals default' do
        expect(sorted_post_reflection.sortable_field).to eq(:position)
      end

    end

  end

end
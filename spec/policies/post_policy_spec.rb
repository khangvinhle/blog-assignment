require 'rails_helper'

describe PostPolicy do
  subject { described_class }
  let!(:post) { create(:post) }
  let!(:user) { nil }

  permissions :show? do
    it 'always viewable' do
      true
    end
  end

  permissions :create?, :new? do
    it 'deny access if user not logged in' do
      expect(subject).not_to permit(user, post)
    end

    it 'grant access if user logged in' do
      expect(subject).to permit(post.user, post)
    end
  end

  permissions :edit?, :update? do
    context 'when not logged in' do
      it { expect(subject).not_to permit(user, post) }
    end

    context 'when logged in' do
      it 'grant access if user is the post creator' do
        expect(subject).to permit(post.user, post)
      end

      it 'deny access if user is not the post creator' do
        user = create(:user)
        expect(subject).not_to permit(user, post)
      end

      it 'grant access if user is admin' do
        user = create(:user, admin: true)
        expect(subject).to permit(user, post)
      end
    end
  end

  permissions :destroy? do
    context('when not logged in') do
      it { expect(subject).not_to permit(user, post) }
    end

    context 'when logged in' do
      it 'grant access if user is the post creator' do
        expect(subject).to permit(post.user, post)
      end

      it 'grant access if user is admin' do
        user = create(:user, admin: true)
        expect(subject).to permit(user, post)
      end

      it 'deny access if user is not the post creator' do
        user = create(:user)
        expect(subject).not_to permit(user, post)
      end
    end
  end
end

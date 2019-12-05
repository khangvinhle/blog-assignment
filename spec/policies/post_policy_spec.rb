require 'rails_helper'

describe PostPolicy do
  subject { described_class }
  let!(:post) { create(:post) }
  let(:random_client_usr) { create(:user) }
  let(:admin_usr) { create(:user, admin: true) }
  let(:scope) { Pundit.policy_scope(user, Post) }

  describe 'Scope' do
    let!(:random_post) { create(:post, user: random_client_usr) }

    context 'client user' do
      let(:user) { random_client_usr }

      it 'allows a limitted records' do
        expect(scope).to contain_exactly(random_post)
      end
    end

    context 'admin user' do
      let(:user) { admin_usr }

      it 'allows to all posts' do
        expect(scope).to contain_exactly(random_post, post)
      end
    end
  end

  permissions :show? do
    it 'always viewable' do
      true
    end
  end

  permissions :create?, :new? do
    it 'deny access if user not logged in' do
      expect(subject).not_to permit(nil, post)
    end

    it 'grant access if user logged in' do
      expect(subject).to permit(post.user, post)
    end
  end

  permissions :edit?, :update? do
    context 'when not logged in' do
      it { expect(subject).not_to permit(nil, post) }
    end

    context 'when logged in' do
      it 'grant access if user is the post creator' do
        expect(subject).to permit(post.user, post)
      end

      it 'deny access if user is not the post creator' do
        expect(subject).not_to permit(random_client_usr, post)
      end

      it 'grant access if user is admin' do
        user = create(:user, admin: true)
        expect(subject).to permit(user, post)
      end
    end
  end

  permissions :destroy? do
    context('when not logged in') do
      it { expect(subject).not_to permit(nil, post) }
    end

    context 'when logged in' do
      it 'grant access if user is the post creator' do
        expect(subject).to permit(post.user, post)
      end

      it 'grant access if user is admin' do
        expect(subject).to permit(admin_usr, post)
      end

      it 'deny access if user is not the post creator' do
        expect(subject).not_to permit(random_client_usr, post)
      end
    end
  end
end

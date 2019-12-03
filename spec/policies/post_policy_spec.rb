require 'rails_helper'
# include Devise::Test::ControllerHelpers
describe PostPolicy do
  subject { described_class }
  # (:user) { create(:user) }
  # subject(:admin_user) { build(:user, admin: true) }
  # subject(:user_post) { build(:post, user: user) }
  let!(:user) { create(:user) }

  permissions :show? do
    it 'always viewable' do
      true
    end
  end

  permissions :create? do
    it 'deny access if user not logged in' do
      sign_out if @current_user.present?
      expect(subject).not_to permit(user,Post.new)
    end

    it 'grant access if user logged in' do
      sign_in user
      expect(subject).to permit(user, Post.new) if @current_user.present?
      sign_out user
    end
  end
end

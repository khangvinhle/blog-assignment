require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  describe 'Authentication' do
    let!(:owen) { create(:user, email: 'faakeowen@gmail.com', password: '111111', password_confirmation: '111111') }

    it 'signs user in and out' do
      sign_in owen
      expect(@current_user) == owen

      sign_out owen
      expect(@current_user).to be_nil
    end
  end
end

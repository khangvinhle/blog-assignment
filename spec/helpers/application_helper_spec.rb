require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  before(:each) do
    allow(helper).to receive(:current_user).and_return(build_stubbed(:user))
    allow(helper).to receive(:user_signed_in?).and_return(true)
  end

  describe '#render_new_post_link' do
    it 'return new post link' do
      expect(helper.render_new_post_link).to include(new_post_path)
      expect(helper.render_new_post_link).to include('New post')
    end
  end

  describe '#render_authentication_links' do
    context 'when user logged in' do
      it 'return log out link' do
        expect(helper.render_authentication_links).to  include(destroy_user_session_path)
        expect(helper.render_authentication_links).to  include('Log out')
      end
    end

    context 'when user not logged in' do
      before do
        allow(helper).to receive(:current_user).and_return(nil)
        allow(helper).to receive(:user_signed_in?).and_return(false)
      end

      it 'return  login and register link' do
        expect(helper.render_authentication_links).to  include(new_user_session_path)
        expect(helper.render_authentication_links).to  include(new_user_registration_path)
        expect(helper.render_authentication_links).to  include('Log in')
        expect(helper.render_authentication_links).to  include('Register')
      end
    end
  end
end

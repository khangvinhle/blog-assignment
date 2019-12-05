require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe '#create' do
    login_user

    def do_request
      post :create, params: { post_id: usr_post, comment: comment_params }
    end

    let(:usr_post) { create(:post) }

    context 'when params are valid' do
      let(:comment_params) { attributes_for(:comment) }

      it 'creates successfully' do
        expect { do_request }.to change { Comment.count }.by(1)
        expect(flash[:notice]).to eq('The comment is created!')
        expect(response).to redirect_to(usr_post)
      end
    end

    context 'when params are invalid' do
      let(:comment_params) { attributes_for(:comment, content: nil) }

      it 'create unsuccessfully' do
        expect { do_request }.to change { Comment.count }.by(0)
        expect(response).to render_template('posts/show')
      end
    end
  end
end

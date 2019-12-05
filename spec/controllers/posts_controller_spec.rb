require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  include Pundit

  describe '#new' do
    login_user

    it 'renders template :new' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    def do_request
      post :create, params: post_params
    end

    login_user

    context 'valid params' do
      let(:post_params) { { post: attributes_for(:post) } }

      it 'creates successfully' do
        expect { do_request }.to change { Post.count }.by(1)
        expect(flash[:notice]).to eq('The post has been created')
        expect(response).to redirect_to post_path(Post.last)
      end
    end

    context 'invalid params' do
      let(:post_params) { { post: attributes_for(:post, title: nil) } }

      it 'creates unsuccessfully' do
        expect { do_request }.to change { Post.count }.by(0)
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#show' do
    login_user
    let!(:usr_post) { create(:post) }

    it 'show post from users' do
      get :show, params: { id: usr_post }
      expect(response).to render_template(:show)
      expect(assigns(:comment)) == usr_post.comments.build
    end
  end

  describe '#edit' do
    login_user
    let(:usr_post) { create(:post, user: subject.current_user) }

    it 'render edit template' do
      get :edit, params: { id: usr_post }
      expect(response).to render_template(:edit)
    end
  end

  describe '#update' do
    login_user
    let(:usr_post) { create(:post, user: subject.current_user) }

    def do_request
      patch :update, params: { id: usr_post, post: post_attributes }
    end

    context 'when params are valid' do
      let(:post_attributes) { attributes_for(:post, title: 'changed') }
      it 'update post successfully' do
        do_request
        expect { usr_post.reload }.to change(usr_post, :title)
      end
    end

    context 'when params are invalid' do
      let(:post_attributes) { attributes_for(:post, title: nil) }
      it 'update post unsuccessfully' do
        expect { do_request }.not_to change(usr_post, :title)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe '#destroy' do
    login_user
    let!(:post) { create(:post, user: subject.current_user) }

    it 'delete a post' do
      expect { delete :destroy, params: { id: post } }.to change(Post, :count).by(-1)
      expect(flash[:notice]).to eq('The post has been deleted!')
      expect(response).to redirect_to root_path
    end
  end
end

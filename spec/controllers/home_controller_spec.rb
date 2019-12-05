require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe '#index' do
    it 'render index template' do
      expect(PostPolicy.new(nil, Post.new).index?).to eq true
      get :index
      expect(response).to render_template(:index)
    end
  end
end

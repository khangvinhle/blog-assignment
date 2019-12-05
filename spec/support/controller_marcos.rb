module ControllerMarcos
  # def login_admin
  #   before(:each) do
  #     @request.env['devise.mapping'] = Devise.mappings[:admin]
  #     sign_in create(:user, admin: true)
  #   end
  # end

  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in create(:user)
    end
  end
end

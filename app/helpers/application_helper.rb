module ApplicationHelper
  def render_authentication_links(class_name = nil)
    if user_signed_in?
      link_to 'Log out', destroy_user_session_path, method: :delete, class: class_name
    else
      link_to('Log in', new_user_session_path, class: class_name) +
          link_to('Register', new_user_registration_path, class: class_name)
    end
  end
end

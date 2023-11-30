class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    sub_user_selection_path # Or :prefix_to_your_route
  end
end

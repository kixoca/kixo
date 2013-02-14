class RegistrationsController < Devise::RegistrationsController

  def update
    @user = User.find(current_user.id)

    if @user.update_without_password(params[:user])
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  protected

  def after_update_path_for(resource)
    edit_user_registration_path
  end
end
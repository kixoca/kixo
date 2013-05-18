class RegistrationsController < Devise::RegistrationsController
  def new
    super
    track_event "New User"
  end

  def create
    super
    track_event "Create User"
  end

  def update
    params[resource_name].delete(:password) if params[resource_name][:password].blank?
    params[resource_name].delete(:password_confirmation) if params[resource_name][:password_confirmation].blank?

    if params[resource_name][:clear_topics]
      resource.destroy_classifications("Topic")
    end

    if params[resource_name][:clear_professions]
      resource.destroy_classifications("Profession")
    end

    if resource.update_attributes(params[resource_name])
      set_flash_message :notice, :updated
      sign_in resource_name, resource, :bypass => true
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      render :edit
    end
  end

  protected

  def after_update_path_for(resource)
    edit_user_registration_path
  end
end
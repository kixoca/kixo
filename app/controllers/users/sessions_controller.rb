class Users::SessionsController < Devise::SessionsController
  def create
    # take into account acts_as_paranoid deleted users
    if ( resource = resource_class.only_deleted.find_by_email(params[resource_name][:email]) )
      if resource.valid_password?(params[resource_name][:password])
        if resource.recover
          flash[:success] = I18n.t("users.restore.success")
          sign_in resource
        else
          flash[:error] = I18n.t("users.restore.error")
        end
      end
    end
    super
    track_event "Create Session"
  end
end
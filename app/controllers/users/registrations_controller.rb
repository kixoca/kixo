class Users::RegistrationsController < Devise::RegistrationsController
  layout "simple", :only => [:new, :new_professional]

  def new
    super
    track_event "New User"
  end

  def new_professional
    @professional = User.new
    track_event "New Professional"
  end

  def create_professional
    @professional = User.new(params[:user])

    if @professional.save
      track_event "Create Professional"
      sign_in :user, @professional
      flash[:success] = I18n.t("users.registrations.create.success")
      redirect_to after_sign_up_path_for(:user)
    else
      track_event "Create Professional Error"
      flash[:error] = I18n.t("users.registrations.create.error")
      render :action => "new_professional"
    end
  end

  def create
    super
    track_event "Create User"
  end

  def update
    if params[resource_name][:password].blank?
      params[resource_name].delete(:password)
      params[resource_name].delete(:password_confirmation)
    end

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

  def crop_headshot
    @user = current_user
  end

  def change_plan
    if !Stripe.api_key.blank? && !params[:plan].blank? && Stripe::Plan.all.map(&:id).include?(params[:plan])
      current_user.plan = params[:plan]
      if current_user.save
        flash[:success] = t("users.registrations.change_plan.success")
      else
        flash[:error] = t("users.registrations.change_plan.error")
      end
    else
      flash[:error] = t("users.registrations.change_plan.error")
    end
    redirect_to "#{edit_user_registration_path}#subscriptions"
  end

  protected

  def after_update_path_for(resource)
    edit_user_registration_path
  end
end
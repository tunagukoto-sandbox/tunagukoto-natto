# frozen_string_literal: true

class Students::RegistrationsController < Devise::RegistrationsController
  # prepend_before_action :require_no_authentication, only: [:cancel]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    super
  end

  # def self.update
  #   self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
  #   prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

  #   resource_updated = update_resource(resource, account_update_params)
  #   yield resource if block_given?
  #   if resource_updated
  #     if is_flashing_format?
  #       flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
  #         :update_needs_confirmation : :updated
  #       set_flash_message :notice, flash_key
  #     end
  #     sign_in resource_name, resource, bypass: true
  #     respond_with resource, location: after_update_path_for(resource)
  #   else
  #     clean_up_passwords resource
  #     respond_with resource
  #   end
  # end


  # DELETE /resource
  # def destroy
  #   #super
  #   # Student.find(params[:id]).destroy
  #   # flash[:success] = "学生登録者を削除しました。"
  #   # redirect_to root_path

  #   # if current_user == resource && current_user.admin?
  #   #   #flash[:error] == "You can't delete yourself"
  #   #   redirect_to user_path(resource)
  #   # else
  #   # end
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  # def after_inactive_sign_up_path_for(resource)
  #   home_policy_path
  # end
  # def current_corporation_is_admin?
  #   student_signed_in? && current_student.has_attribute?(:admin)
  # end

  # def sign_up(resource_name, resource)
  #  sign_in(resource_name, resource)
  #   if !current_student_is_admin?
  #     sign_in(resource_name, resource)
  #   end
  #  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # これがないとなぜかログインしてもPOSTが送られない
  
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

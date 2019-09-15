# frozen_string_literal: true

class Corporations::SessionsController < Devise::SessionsController
  prepend_before_action :require_no_authentication, only: [:cancel]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

    protected

  def current_corporation_is_admin?
    corporation_signed_in? && current_corporation.has_attribute?(:admin)
  end

  def sign_in(resource_name, resource)
    sign_in(resource_name, resource)
    if !current_corporation_is_admin?
      sign_in(resource_name, resource)
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

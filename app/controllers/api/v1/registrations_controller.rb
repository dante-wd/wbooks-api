# frozen_string_literal: true

# Registrations controller class
class RegistrationsController < Devise::RegistrationsController
  protect_from_forgery
  respond_to :json

  def create
    build_resource(sign_up_params)

    resource.save
    render_resource(resource)
  end
end

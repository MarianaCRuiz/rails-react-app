class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: exception.record.errors.full_messages, status: :unprocessable_entity
  end
end

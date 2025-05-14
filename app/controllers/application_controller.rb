class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_up_path_for(resource)
    subscriptions_path # Redirect to the subscription plans page after sign-up
  end

  def after_sign_in_path_for(resource)
    subscriptions_path # Redirect to the subscription plans page after sign-in
  end
end

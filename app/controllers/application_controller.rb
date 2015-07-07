class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include CurrentCart
  before_action :set_cart

  protect_from_forgery with: :exception
  # protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
  # acts_as_token_authentication_handler_for User

  private 
    # Generates not authorized exception message
    def user_not_authorized
      flash[:error] = "Access denied."
      redirect_to (request.referrer || root_path)
    end

end

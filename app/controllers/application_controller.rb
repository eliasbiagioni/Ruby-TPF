class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception

   rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden }
        format.html { redirect_to root_url, :alert => exception.message }
      end
   end

   def is_authenticated
      redirect_to root_url if !current_user.present?
   end

   def user_signed_in?
      current_user.present?
   end

   private

   def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end

   helper_method :current_user
end

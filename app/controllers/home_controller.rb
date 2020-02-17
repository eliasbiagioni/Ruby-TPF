class HomeController < ApplicationController
  
  before_action :set_auth

  def index
    redirect_to catalogs_url if current_user
  end

  private

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end
end

class SessionsController < ApplicationController

    def create
        auth = request.env['omniauth.auth']
        session[:omniauth] = auth.except('extra')
        user = User.sign_in_from_omniauth(auth)
        session[:user_id] = user.id
        redirect_to root_url
    end
    
    def destroy
        session[:omniauth] = nil
        session[:user_id] = nil
        redirect_to root_url#, notice: 'SIGNED OUT'
    end

end

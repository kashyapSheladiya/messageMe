class SessionsController < ApplicationController
    
    def new
    end

    def create
        @user = User.find_by(username: params[:session][:username])

        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            flash[:success] = "Wel Come to Chat Room."
            redirect_to root_path
        else
            flash.now[:error] = "Invalid credentials"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "Successfully logged out."
        redirect_to login_path
    end
end

class AccountController < ApplicationController

    def login
        if request.post?
            @user = User.authenticate(params[:email],params[:password])
            if @user
                session[:user] = @user.id
                flash[:notice] = "You are logged In!"
                redirect_to :controller=>:home, :action=>:index
            else 
                flash[:notice] = "Invalid Username/Password"
                render :login
            end
        end
    end

    def signup
        if request.post?
            @new_user = User.new(user_params)
            if @new_user.save
                #trigger the email
                flash[:notice]="Account is created."
                redirect_to :action=>:login
            else
                render :action=>:signup
            end
        end
    end

    def logout
        session[:user] = nil
        flash[:notice] = "you are logged out"
        redirect_to :action=>:login
    end


    private
        def user_params
            params.permit(:first_name, :last_name, :email,:mobile_number, :date_of_birth,:password, :hashed_password)

        end
end

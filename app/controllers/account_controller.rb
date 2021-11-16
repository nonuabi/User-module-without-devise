class AccountController < ApplicationController

    def login
        
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


    private
        def user_params
            params.permit(:first_name, :last_name, :email,:mobile_number, :date_of_birth,:password, :hashed_password)

        end
end

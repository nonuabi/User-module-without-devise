class PasswordController < ApplicationController
    def forget
        if request.post?
            @user = User.find_by_email(params[:email])
            if @user
                new_password = random_password

                @user.update(:password=>new_password)
                puts '-------------------new password-------------------'
                puts new_password
                puts '-------------------new password-------------------'
                # email notifier -- here--
                flash[:notice] = "A new password has been generated"
                redirect_to :controller=>:account, :action=>:login
            else 
                flash[:notice] = "Invalid Email, Please enter correct email"
                render :action =>:forget
            end
        end
    end

    def random_password
        (0..8).map{65.+(rand(25)).chr}.join
    end

    def reset
        @user = User.find(session[:user])
		
		if request.post?			
			if @user
			@user.update(:password=>params[:user][:password])
			# UserNotifier.reset_password_confirmation(@user).deliver
            puts '-------------resetting the password----------------'
            puts '-----------------------end-------------------------'
			flash[:notice] = "Your password has been reset"
			redirect_to :controller=>:account, :action=>:login
			
			else
				render :action=>:reset
				
			end
		end
    end
end
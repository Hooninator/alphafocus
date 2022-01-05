class LoginController < ApplicationController
    def login 
        @success_msg = params[:msg]
        usrname = params[:username]
        if usrname==nil
            return
        end
        
        @usr = Usr.where("usrname=?", usrname).first
        if @usr==nil
            @message = "PIMPS WITH THE LETTER J "
            return
        end

        password = params[:password]
        if password==@usr.password 
            redirect_to usr_path(:id=>@usr.id)
        else 
            #Error handling
        end
    end

    def create_account
        username = params[:username]
        password = params[:password]
        repeat_password = params[:password_repeat]
        duplicate_usr = Usr.where("usrname=?", username)
        if duplicate_usr!=nil 
            #Error handling 
        end

        if password!=repeat_password
            #Error handling 
        end

        if password==nil && username==nil
            return
        end

        Usr.create({:usrname => username, :password => password})
        redirect_to login_path(:msg => "Account successfully created!")
        
    end
end
class LoginController < ApplicationController
    def login 
        ##TODO: session thing, profile button using JS, and strong params, and also a Todo list feature, and rankings AND here's what would be cool: achievements!
        ##@success_msg = params[:msg]
        usrname = params[:username]
        if usrname==nil
            return
        end
        
        @usr = Usr.where("usrname=?", usrname).first
        if @usr==nil
            flash[:warning] = "Wrong username or password"
            return
        end

        password = params[:password]

        if password==@usr.password 
            session[:user_id] = @usr.token
            redirect_to usr_path(:id=>@usr.id)
        else 
            flash[:warning] = "Wrong username or password"
            return
        end
    end

    def create
        #render create user view
    end

    def logout
        session[:user_id] = nil
        redirect_to login_path and return
    end

end
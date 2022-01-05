class LoginController < ApplicationController
    def login 
        ##TODO: session thing, profile button using JS
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
            redirect_to usr_path(:id=>@usr.id)
        else 
            flash[:warning] = "Wrong username or password"
            return
        end
    end

    def create
        #render create user view
    end

end
class SessionsController < ApplicationController
    def new
    end
    def create
        #check if the user exists
        @user = User.find_by({"email" => params["email"] })
        if @user
        #if they do, check they know their passwords
            #if params["password"] == @user ["password"]
            if BCrypt::Password.create(params["user"]["password"]) == params["password"]
            #if they do, send them in
            redirect_to "/companies"   
            else
            redirect_to "/sessions/new" 
            end
        else
        redirect_to "/sessions/new"   
        end
    end
end

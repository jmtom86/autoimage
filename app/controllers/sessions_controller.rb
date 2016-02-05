class SessionsController < ApplicationController
  def create
  	user = User.find_by(email: params[:email])
  	if user
  		if user.authenticate(params[:password])
  			session[:user_id] = user.id
  			redirect_to "/main"
  		else
  			flash[:errors] = ["Invalid Email/Password combination"]
  			redirect_to "/sessions/index"
  		end
  	else
  		flash[:errors] = ["Invalid Email/Password combination"]
  		redirect_to "/sessions/index"
  	end
  end

  def index
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/sessions/index"
  end
end

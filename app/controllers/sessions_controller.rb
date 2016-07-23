class SessionsController < ApplicationController

  def new

  end

  def create

    user = User.find_by( email: params[:session][:email].downcase )

    puts "password"
    puts user.authenticate( params[:session][:password] )
    puts "email"
    puts params[:session][:email]
    puts "user"
    puts user.username

    if user && user.authenticate( params[:session][:password] )
      session[:user_id] = user.id
      flash[:success] = "Welcome " + user.username + "! You are logged in"
      redirect_to user_path( user )
    else
      # since render is not considered a new http request
      # the flash messages has to be "flas.now"
      flash.now[:danger] = "Password or email is invalid"
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You are logged out"
    redirect_to root_path
  end

end
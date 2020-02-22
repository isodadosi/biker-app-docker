class SessionsController < ApplicationController



  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to users_path
    else
      render 'users/login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
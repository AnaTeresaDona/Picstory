class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) 
    if user && user.authenticate(params[:session][:password]) 
      session[:user_id] = user.id 
      redirect_to root_path, notice: 'Logueado correctamente'
    else 
      flash.now[:alert] = 'Email o password inválidos'
      render action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out successfully"
  end
end

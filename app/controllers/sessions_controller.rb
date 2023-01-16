class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(first_name: user_params[:first_name])
    if user && user.authenticate(user_params[:password])

      session[:user_id] = user.id
      flash[:notice]="Login successful"
      redirect_to '/'
    else
      
      flash[:notice]="Invalid Email or Password"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice]="Logged Out"
   
     redirect_to '/cabs'
  end
  private

  def user_params
  params.require(:user).permit(:first_name,:password)
  end
end

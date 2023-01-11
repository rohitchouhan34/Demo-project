class UsersController < ApplicationController
    
      def show
        @user = User.find(params[:id])
      end
    
      def new
        @user = User.new
      end
    
      def create
        @user = User.new(user_params)
    
        if @user.save
    
          session[:user_id]=@user.id
          redirect_to cabs_path, notice: "success fully created account"
        else
          render :new, status: :unprocessable_entity
        end
      end
      private
      def user_params
        params.require(:user).permit(:first_name, :last_name,:password,:password_confirmation)
      end
end

class BookingsController < ApplicationController
    def index
        @bookings = Booking.all
    end
    def show
      
         @booking = Booking.find(params[:id])
        
    end
      def new
        
        i  byebugf session[:user_id]
          @user=User.find_by(id:session[:user_id])
        end

        @booking = @user.bookings.new
      end

      def create
      
        if session[:user_id]
         
          @user=User.find_by(id:session[:user_id])
        end
        @cab = Cab.find(params[:cab_id])
        
        @booking = @user.bookings.new(booking_params)
        @booking.cab_id=@cab.id
      

        if @booking.save
        
          
          redirect_to cab_booking_path(@cab.id,@booking.id)
       
        else
          render :new, status: :unprocessable_entity
        end
      end

      private
      def booking_params
        params.require(:booking).permit(:date, :payment_type)
      end
end

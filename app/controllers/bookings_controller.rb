class BookingsController < ApplicationController
    def index
        @bookings = Booking.all
        if session[:user_id]
          @user=User.find_by(id:session[:user_id])
        end
        
      end
      def show
        @booking = Booking.find(params[:id])
      end
      def new
        
        if session[:user_id]
          @user=User.find_by(id:session[:user_id])
        end

        @booking = @user.bookings.new
      end

      def create
      
        if session[:user_id]
         
          @user=User.find_by(id:session[:user_id])
        end
        @cab = Cab.find(params[:id])
        
        @booking = @user.bookings.new(booking_params)
        @booking.cab_id=@cab.id
      

        if @booking.save
          redirect_to @booking
        else
          render :new, status: :unprocessable_entity
        end
      end

      private
      def booking_params
        params.require(:booking).permit(:date, :payment_type)
      end
end

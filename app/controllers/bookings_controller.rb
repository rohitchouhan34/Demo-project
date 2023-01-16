class BookingsController < ApplicationController
  def index
          @bookings = Booking.all
         
        end
        def show
          @booking = Booking.find(params[:id])
    
        end
        def new
          
          # if session[:user_id]
          #   @user=User.find_by(id:session[:user_id])
          # end
          current_user
  
          @booking = @current_user.bookings.new
        end
  
        def create
        
          current_user
        
             @cab = Cab.find(params[:cab_id])
  
          
          @booking = @current_user.bookings.new(booking_params)
  
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
  
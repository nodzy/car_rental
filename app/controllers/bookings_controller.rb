class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  before_action :set_car, only: [:index, :new, :create]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = @car.bookings.order(:starting).all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = @car.bookings.build
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = @car.bookings.build(booking_params)

    respond_to do |format|
      if @booking.save
        format.html do
          redirect_to root_path
          flash[:success] = 'Booking was successfully created.'
        end
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html do
          redirect_to car_bookings_path(@car)
          flash[:success] = 'Booking was successfully updated.'
        end
        format.json { render :index, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html do
        redirect_to car_bookings_path(@car)
        flash[:success] = 'Booking was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
    params.require(:booking).permit(:client, :phone, :place, :car_id, :starting, :ending)
  end
end

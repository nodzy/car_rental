class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @car = Car.find(params[:car_id])
    @bookings = @car.bookings.order(:from).all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show

  end

  # GET /bookings/new
  def new
    @car = Car.find(params[:car_id])
    @booking = @car.bookings.build
  end

  # GET /bookings/1/edit
  def edit
   @car = Car.find(params[:car_id])
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @car = Car.find(params[:car_id])
    @booking = @car.bookings.build(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to root_path, notice: 'Booking was successfully created.' }
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
     @car=Car.find(params[:car_id])
	 @booking = @car.bookings.find(params[:id])
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to car_bookings_path(@car), notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
     @car=Car.find(params[:car_id])
	 @booking = @car.bookings.find(params[:id])
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:from, :to, :client, :phone, :place, :car_id)
    end
end

module Admin
  class ReservationsController < AdminController
    before_action :set_reservation, only: [:show, :edit, :update, :destroy]

    def index
      @reservations = Reservation.all
    end

    def calendar
      @reservations = Reservation.all
    end

    def show
    end

    def new
      @reservation = Reservation.new
    end

    def edit
    end

    def create
      @reservation = Reservation.new(reservation_params)

      if @reservation.save
        redirect_to admin_reservations_path, notice: 'Rezervace byla úspěšně vytvořena.'
      else
        render :new
      end
    end

    def update
      if @reservation.update(reservation_params)
        redirect_to admin_reservations_path, notice: 'Rezervace byla úspěšně upravena.'
      else
        render :edit
      end
    end

    def destroy
      @reservation.destroy
      redirect_to admin_reservations_path, notice: 'Rezervace byla úspěšně smazána.'
    end

    private
      def set_reservation
        @reservation = Reservation.find(params[:id])
      end

      def reservation_params
        params.require(:reservation).permit(:date_from, :date_to, :name, :email, :notice, :state)
      end
  end
end

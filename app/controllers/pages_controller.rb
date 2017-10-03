class PagesController < ApplicationController
  def home
  end

  def price
  end

  def reservation
    @current_year = Date.current.year
    @months = [*1..12]
    @reservations = Reservation.all
  end
end

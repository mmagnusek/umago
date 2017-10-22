module ApplicationHelper
  def calendar_date_class(reservations, date)
    current = reservations.select { |r| (r.date_from..r.date_to).cover?(date) }
    case current.size
    when 1
      reservation = current.first
      if    date == reservation.date_from  then "start-#{reservation.state}"
      elsif date == reservation.date_to    then "end-#{reservation.state}"
      else reservation.state
      end
    when 2
      first, second = current
      "end-#{first.state} start-#{second.state}"
    end
  end
end

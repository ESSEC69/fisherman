class BookingMailer < ApplicationMailer
 def booking_confirmation(booking)
   @booking = booking

   mail(
     to:       @booking.user.email,
     subject:  "Booking : #{booking.spot.title} - Etat : #{@booking.status}"
   )
 end

 def booking_demand(booking)
  @booking = booking

   mail(
     to:       @booking.spot.user.email,
     subject:  "New Booking : #{booking.spot.title} - Etat : #{@booking.status}"
   )
 end
end

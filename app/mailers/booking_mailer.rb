class BookingMailer < ApplicationMailer
 def booking_confirmation(booking)
   @booking = booking

   mail(
     to:       @booking.user.email,
     subject:  "Booking : #{booking.spot.title} - Etat : #{@booking.status}"
   )
 end
end

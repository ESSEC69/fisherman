class SpotMailer < ApplicationMailer
 def creation_confirmation(spot)
   @spot = spot

   mail(
     to:       @spot.user.email,
     subject:  "Spot #{@spot.title} a bien été créé!"
   )
 end
end

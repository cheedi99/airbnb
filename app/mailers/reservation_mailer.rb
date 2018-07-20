class ReservationMailer < ApplicationMailer
	default from: 'notifications@example.com'
 
  def booking_email(user,listing_id)
    @user = user
    @url  = 'http://localhost:3000/braintree/new'

    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end


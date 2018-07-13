class ReservationJob < ApplicationJob
  queue_as :default

  def perform(customer,listing_id)
    # Do something later
    ReservationMailer.booking_email(customer,listing_id).deliver_now
  end

end

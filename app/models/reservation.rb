class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing

	validate :check_overlapping_dates

	before_save :calculate_the_price

	def calculate_the_price
		listing = Listing.find(self.listing_id)

		self.number_of_days = self.end_date - self.start_date
		self.total_price = self.number_of_days * listing.price 
	end

	def check_overlapping_dates	
		Reservation.where("listing_id = ?", self.listing_id).each do |reservation|
			if self.overlaps?(reservation)
				return errors.add(:check_overlapping_dates, "This date is not valid")
			end
		end
		return true
	end
	
	def overlaps?(other)			
		self.start_date <= other.end_date && other.start_date <= self.end_date
	end	
end



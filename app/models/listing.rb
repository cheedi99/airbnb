class Listing < ApplicationRecord
	belongs_to :user

	# validates :title, presence: true, length: {minimum:5}
	mount_uploaders :avatars, AvatarUploader

	has_many :reservations

	scope :city, -> (city) { where city: city }
	scope :property_type, -> (property_type) { where("property_type ilike ?", "#{property_type}")}
	scope :number_of_rooms, -> (number_of_rooms) { where number_of_rooms: number_of_rooms }
	scope :number_of_bathrooms, -> (number_of_bathrooms) { where number_of_bathrooms: number_of_bathrooms }
	scope :price_range, -> (from,to) {where ("price >= ? AND price <= ?"), from, to}
	# scope :location, -> (location_id) { where location_id: location_id }
  	# scope :starts_with, -> (name) { where("name like ?", "#{name}%")}


end

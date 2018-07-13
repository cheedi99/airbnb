class Listing < ApplicationRecord
	belongs_to :user

	# validates :title, presence: true, length: {minimum:5}
	mount_uploaders :avatars, AvatarUploader

	has_many :reservations
end
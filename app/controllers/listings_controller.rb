class ListingsController < ApplicationController
	def index
		@listing = Listing.page(params[:page]).per(10)
	end
		
	def show
		@listing = Listing.find(params[:id])
	end	

	def new
		@listing = Listing.new
	end

	def edit
        @listing = Listing.find(params[:id])
    end

	def create
		@listing = Listing.new(listing_params)

		@listing.user_id = current_user.id

		if @listing.save
			redirect_to @listing
		else	
			render 'new'
	    end	
	end

	def update	
		@listing = Listing.find(params[:id])

		if @listing.update(listing_params)
			redirect_to @listing
		else	
			render 'edit'
		end
	end


	def destroy
	  @listing = Listing.find(params[:id])
	  @listing.destroy
	 
	  redirect_to listings_path
	end		

	private
	  def listing_params
	  	params.require(:listing).permit(:name, :country, :city, :area, :street, 
	  		:property_type, :number_of_guest, :number_of_rooms, :number_of_bathrooms, :price)
	  end	
end
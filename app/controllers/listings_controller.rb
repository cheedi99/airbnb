class ListingsController < ApplicationController

	def search
		@listing = Listing.all
		@listing = Listing.page(params[:page]).per(5)
		@listing = @listing.price_range(params[:from],params[:to]) if params[:from].present? || params[:to].present?

		filtering_params(params).each do |key, value|
     	@listing = @listing.public_send(key, value) if value.present?
   		end

   		respond_to do |format|
   			format.html
   			format.js { render :layout => false }
   			format.json { render json: @listing }
   		end	

		# @listing = @listing.city(params[:city]) if params[:city].present?

		if @listing.empty?
			flash[:notice] = "Cannot find listings with #{params[:city]}"
		end
	end	

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
	  def filtering_params(params)
	  	params.slice(:city, :property_type, :number_of_rooms, :number_of_bathrooms)
	  end	


	  def listing_params
	  	params.require(:listing).permit(:name, :country, :city, :area, :street, 
	  		:property_type, :number_of_guest, :number_of_rooms, :number_of_bathrooms, :price, {avatars: []})
	  end	
end

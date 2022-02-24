class ListingsController < ApplicationController
  before_action :current_user_must_be_listing_seller, only: [:edit, :update, :destroy] 

  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  # GET /listings
  def index
    @listings = Listing.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@listings.where.not(:location_latitude => nil)) do |listing, marker|
      marker.lat listing.location_latitude
      marker.lng listing.location_longitude
      marker.infowindow "<h5><a href='/listings/#{listing.id}'>#{listing.seller_id}</a></h5><small>#{listing.location_formatted_address}</small>"
    end
  end

  # GET /listings/1
  def show
    @message = Message.new
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      message = 'Listing was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @listing, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /listings/1
  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: 'Listing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /listings/1
  def destroy
    @listing.destroy
    message = "Listing was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to listings_url, notice: message
    end
  end


  private

  def current_user_must_be_listing_seller
    set_listing
    unless current_user == @listing.seller
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def listing_params
      params.require(:listing).permit(:seller_id, :title, :listing_title, :price, :category, :location, :status, :buyer_id, :picture)
    end
end

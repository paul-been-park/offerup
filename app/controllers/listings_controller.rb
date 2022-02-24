class ListingsController < ApplicationController
  before_action :current_user_must_be_listing_seller,
                only: %i[edit update destroy]

  before_action :set_listing, only: %i[show edit update destroy]

  def index
    @q = Listing.ransack(params[:q])
    @listings = @q.result(distinct: true).includes(:seller, :messages,
                                                   :prospective_buyers, :message).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@listings.where.not(location_latitude: nil)) do |listing, marker|
      marker.lat listing.location_latitude
      marker.lng listing.location_longitude
    end
  end

  def show
    @message = Message.new
  end

  def new
    @listing = Listing.new
  end

  def edit; end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      message = "Listing was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @listing, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: "Listing was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @listing.destroy
    message = "Listing was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to listings_url, notice: message
    end
  end

  private

  def current_user_must_be_listing_seller
    set_listing
    unless current_user == @listing.seller
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:seller_id, :title, :listing_title,
                                    :price, :category, :location, :status, :buyer_id, :picture)
  end
end

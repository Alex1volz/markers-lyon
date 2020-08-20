class MarketsController < ApplicationController
  def index
    @markets = Market.all

    @markers = @markets.map do |market|
      {
        lat: market.latitude,
        lng: market.longitude
      }

    end

      @search_lat = 0.0
      @search_lon = 0.0

    if params[:search][:query]
      @search_address = params[:search][:query]
    else
      @search_address = "1 Place de la Comédie, 69001 Lyon"
    end

      @search_lat = Geocoder.search(@search_address).first.data["lat"]
      @search_lon = Geocoder.search(@search_address).first.data["lon"]
      @markets = Market.near([@search_lat, @search_lon])

  end
  #   if params[:day].present? && params[:day] == "monday"
  #     @markets = @markets.where(monday: ture)
  #   end

  #   if params[:day].tuesday.present?
  #     @markets += @markets.where(tuesday: ture)
  #   end

  #   if params[:wednedsday].monday.present?
  #     @markets = @markets.where(wednedsday: ture)
  #   end

  #   if params[:search].present?
  #     @markets = @markets.where()
  #   end

  #   if params[:night].present?
  #     @markets = @markets.where()
  #   end
  # end

  def show
  end
end

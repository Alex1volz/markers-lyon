class MarketsController < ApplicationController
  def index
    @markets = Market.all

    @markers = @markets.map do |market|
      {
        lat: market.latitude,
        lng: market.longitude
      }
    end
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
    # @market = Market.find(params[:id])
  end
end

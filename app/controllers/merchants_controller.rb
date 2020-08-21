class MerchantsController < ApplicationController
  def index
    Merchant.destroy_all
  end
end

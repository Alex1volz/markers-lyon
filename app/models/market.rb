class Market < ApplicationRecord
  has_many :merchants
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_street?

  private
  def address
      [street, postal_code, city, "France"].compact.join(', ')
  end
end

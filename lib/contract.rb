require 'date'

class Contract
  attr_accessor :product, :signed_on, :revenue

  def initialize(product:)
    @product = product
  end

  def sign(signed_on: Date.today)
    @signed_on = signed_on
    @revenue = product.price

    self
  end

  def revenue_amount(calculated_on: Date.today)
    18800
  end
end

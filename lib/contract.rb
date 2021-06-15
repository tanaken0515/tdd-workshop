require 'date'

class Contract
  attr_accessor :product, :signed_on, :revenue

  def initialize(product:)
    @product = product
  end

  def sign
    @signed_on = Date.today
    @revenue = 18800

    self
  end
end
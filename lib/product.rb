class Product
  attr_accessor :category, :name, :price

  def initialize(category:, name:, price:)
    @category = category
    @name = name
    @price = price
  end
end

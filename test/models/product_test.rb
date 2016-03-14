require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "not empty" do
    product=Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end

  test "price_larger_than_zero" do
    product = Product.new(title: "Book",
                          description: "info",
                          image_url: "2.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
                 product.errors[:price].join('; ')
    product.price = 0
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
                 product.errors[:price].join('; ')
    product.price = 1
    assert product.valid?
  end

  test "uniqueness" do
    product = Product.new(title: products(:two).title,
                          description: "info",
                          price: 1,
                          image_url: "fred.gif")
    assert !product.save
    assert_equal "has already been taken", product.errors[:title].join('; ')
  end

end

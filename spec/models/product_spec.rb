require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    before(:each) do
      @category = Category.new(name: "Hats")
      @category.save
    end

    it 'should be able to save after creation' do
      @product = @category.products.create(name: "Yellow Cat", price_cents: 7000, quantity: 3)
      expect(@product.name).to eq("Yellow Cat")
      expect(@product.category.name).to eq("Hats")
      @product.save!
    end

    it 'should output an error message when given a product with a blank name' do
      @product = @category.products.create(name: nil, price_cents: 8000, quantity: 5)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should ouput an error message when price is nil' do
      @product = @category.products.create(name: "Tangerine", price_cents: nil, quantity: 5)
      @product.save
      expect(@product.errors.full_messages).to include("Price cents is not a number")
    end

    it 'should output an error when given nil quantity' do
      @product = @category.products.create(name: "Dog Head", price_cents: 5000, quantity: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "should output an error when category is blank" do
      @product = Product.new(name: "Cat Hat", price_cents: 3000, quantity: 5, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end

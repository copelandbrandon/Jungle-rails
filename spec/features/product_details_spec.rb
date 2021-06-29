require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'can navigate to the product description page' do
    visit root_path
    click_link('Details', match: :first)
    sleep 1
    save_screenshot "test-two-product-description.png"
    expect(page).to have_css('.product-detail')
  end
end

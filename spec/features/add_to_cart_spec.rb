require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario 'cart text should update when an item is added' do
    visit root_path
    first('.btn-primary').click
    sleep 1
    save_screenshot 'test-three-home-page.png'
    expect(page).to have_text 'My Cart (1)', count: 1
  end

end

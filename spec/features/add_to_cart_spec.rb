require 'rails_helper'

RSpec.feature "Add to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: 'https://jungleapplication.s3.us-east-2.amazonaws.com/apparel1.jpg',
      quantity: 10,
      price: 64.99
    )
  end

scenario "They see all products" do
  # ACT
  visit root_path

  expect(page).to have_content('My Cart (0)')

  # VERIFY
  click_button('Add')

  expect(page).to have_content('My Cart (1)')

  # DEBUG
  save_screenshot

end
end
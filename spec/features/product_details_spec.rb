require 'rails_helper'

RSpec.feature "Visitor click one of the product partials and get to new page", type: :feature, js: true do

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

    # VERIFY
    find('a.btn-default').click

    expect(page).to have_content('Description')

    # DEBUG
    save_screenshot

  end

end 
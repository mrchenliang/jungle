class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['STRIPE_ADMIN_USERNAME'], password: ENV['STRIPE_ADMIN_PASSWORD']
  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end

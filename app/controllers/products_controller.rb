class ProductsController < ApplicationController
  http_basic_authenticate_with name: ENV['STRIPE_ADMIN_USERNAME'], password: ENV['STRIPE_ADMIN_PASSWORD']
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

end

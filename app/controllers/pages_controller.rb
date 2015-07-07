class PagesController < ApplicationController
  def home
    @products = Product.page(1) 
    @promo = Product.first
  end
end

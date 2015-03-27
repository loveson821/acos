class ProductsController < InheritedResources::Base
  layout "shopping"
  private

    def product_params
      params.require(:product).permit(:name, :price, :shop_id, :image)
    end
end


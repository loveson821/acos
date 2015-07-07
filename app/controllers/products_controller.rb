class ProductsController < InheritedResources::Base
  # layout "shopping"

  def index
    @products = Product.filter(filtering_params(params)).page(params[:page])
    # @products = Product.where("name like ?", "%#{params[:name]}%")
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :shop_id, :image)
  end

  def filtering_params(params)
    params.slice(:contains , :price)
  end
end


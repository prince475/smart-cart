class ProductsController < ApplicationController

    def index
        @products = Product.all
        if current_user
            render json: current_user.products, status: :ok
        else
            render json: { error: "Not authorized" }, status: :unathorized
        end
    end

    def create
        if current_user
            @product = Product.create(product_params)
            render json: @product, status: :created
        else
            render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def product_params
        params.permit(:image, :description, :unit_price, :quantity, :total).merge(user_id: current_user.id)
    end
end


# {
#     "image": "image1.com",
#     "description": "soda",
#     "unit_price": 60,
#     "quantity": 3
# }
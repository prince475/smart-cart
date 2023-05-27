class ProductSerializer < ActiveModel::Serializer
  attributes :id, :image, :description,:unit_price, :quantity, :total
end

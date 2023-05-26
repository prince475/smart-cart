class UserSerializer < ActiveModel::Serializer
  attributes except: [:created_at, :updated_at]
end

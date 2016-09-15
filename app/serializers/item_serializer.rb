class ItemSerializer < ActiveModel::Serializer
  attributes :id, :item_name, :status, :list
end

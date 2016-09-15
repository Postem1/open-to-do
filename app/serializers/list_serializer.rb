class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :permissions, :user
end

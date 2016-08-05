class Item < ActiveRecord::Base
  belongs_to :list

  validates :item_name, presence: true

end

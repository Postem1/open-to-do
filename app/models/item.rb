class Item < ActiveRecord::Base
  belongs_to :list

  validates :item_name, presence: true
  validates :status, presence: true
  validates :status, inclusion: { in: %w(complete incomplete),
                                  message: "%{value} is not valid" }, allow_nil: true
end

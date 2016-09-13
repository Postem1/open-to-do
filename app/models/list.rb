class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :title, presence: true
  validates :permissions, presence: true
  validates :permissions, inclusion: {  in: %w(private viewable open),
                                        message: "%{value} is not a valid permission" }, allow_nil: true
end

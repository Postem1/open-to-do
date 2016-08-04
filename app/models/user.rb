class User < ActiveRecord::Base
  has_many :lists

  validates :name, presence: true
  validates :password, presence: true
end

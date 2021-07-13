class Message < ApplicationRecord
  has_many :comments
  belongs_to :user
  validates :message, :presence => true, length: {minimum: 10}
  validates :user, :presence => true
end

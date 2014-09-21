class Category < ActiveRecord::Base
  belongs_to :owner, class_name: User
  validates :name, presence: true, length: {maximum: 255}
  validates :owner, presence: true
end
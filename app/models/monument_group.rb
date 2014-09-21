class MonumentGroup < ActiveRecord::Base
  belongs_to :owner, class_name: User
  has_many :monuments, -> { order :name }, dependent: :destroy
  validates :name, presence: true, length: {maximum: 255}
  validates :owner, presence: true
end

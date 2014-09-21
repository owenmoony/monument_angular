class Monument < ActiveRecord::Base
  belongs_to :group, class_name: 'MonumentGroup', foreign_key: :monument_group_id
  has_and_belongs_to_many :categories
  validates :group, presence: true
  validates :name, presence: true, length: {maximum: 255}
end

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :monument_groups, foreign_key: :owner_id

  after_create :create_monument_group

  def clear_authentication_token!
    update_attribute(:authentication_token, nil)
  end

  def create_monument_group
    monument_groups.create!(name: "My First Monument Collection")
  end

end

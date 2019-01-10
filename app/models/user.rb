class User < ApplicationRecord
  enum role: { common: 0, admin: 1 }
  devise :database_authenticatable, :registerable, :validatable

  has_many :travels, dependent: :destroy

  validates :name, presence: true, length: { in: 1..20 }
  validates :role, presence: true, inclusion: { in: User.roles.keys }
end

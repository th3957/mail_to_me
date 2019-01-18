class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_many :travels, dependent: :destroy
  has_many :lists, dependent: :destroy

  enum role: { common: 0, admin: 1 }

  validates :name, presence: true, length: { in: 1..20 }
  validates :email, presence: true, length: { in: 1..50 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }
  validates :role, presence: true, inclusion: { in: User.roles.keys }
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = %w[user admin].freeze

  validates :role, presence: true
  validates :role, inclusion: { in: ROLES }
  validates_uniqueness_of :email

  def admin?
    role == 'admin'
  end

  def user?
    role == 'user'
  end
end

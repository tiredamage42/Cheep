class User < ApplicationRecord
  validates_uniqueness_of :user_name, :email

  has_many :posts

  acts_as_voter

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable, :lockable
end

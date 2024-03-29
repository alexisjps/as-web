class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :invoices, dependent: :destroy
  has_many :clients, dependent: :destroy
  has_many :quotes, dependent: :destroy
  # has_many :tickets, dependent: :destroy
  has_one_attached :photo
end

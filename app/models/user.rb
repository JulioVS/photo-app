class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  # Realacion de Usuarios y Pagos (en realidad, solo puede tener 0 o 1 pago)
  has_one :payment
  # Esto es porque el formulario de pago va a tener embebidos datos del usuario tambien
  accepts_nested_attributes_for :payment
end

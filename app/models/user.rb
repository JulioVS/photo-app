class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  # Relación entre Usuarios y Pagos (en realidad, un usuario solo puede tener uno o ningún pago)
  has_one :payment
  
  # Esto es porque el formulario de usuarios va a tener embebido datos del pago tambien
  accepts_nested_attributes_for :payment

  has_many :images 
end

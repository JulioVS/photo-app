class Payment < ApplicationRecord
  # Los datos de la tarjeta de crédito NO se van a guardar en la base de datos.-
  # Solamente van a existir transitoriamente en memoria durante el proceso de
  # pago con Stripe.-
  attr_accessor :card_number, :card_cvv, :card_expires_month, :card_expires_year

  # Un pago pertenece siempre a un (unico) usuario.-
  belongs_to :user

  def self.month_options 
    Date::MONTHNAMES.compact.each_with_index.map { |name, i| ["#{i+1} - #{name}", i+1 ] }
  end

  def self.year_options 
    ( Date.today.year..(Date.today.year+10) ).to_a  
  end

  def process_payment
    # Creo un cliente Stripe con los datos del presente usuario (User)
    customer = Stripe::Customer.create email: email, card: token

    # Creo un cargo a la tarjeta de crédito del cliente por U$S 10 
    # (expresado como 1.000 centavos de dolar)
    Stripe::Charge.create customer: customer.id,
                          amount: 1000,
                          description: 'Premiun',
                          currency: 'usd'
  end 

end

# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Udemy Rails:  Mailgun (add-on de mailing para Heroku), configuracion inicial.-
#               Las variables de entorno las cargó el instalador de Mailgun directo en Heroku.-
#               La URL es la del deploy de esta app en Heroku (produccion).-
ActionMailer::Base.smtp_settings = {
  :port           => ENV['MAILGUN_SMTP_PORT'],
  :address        => ENV['MAILGUN_SMTP_SERVER'],
  :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
  :password       => ENV['MAILGUN_SMTP_PASSWORD'],
  :domain         => 'photo-app-je-d9cfce362fe9.herokuapp.com',
  :authentication => :plain,
}
# ActionMailer::Base.delivery_method = :smtp
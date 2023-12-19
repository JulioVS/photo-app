# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Udemy Rails:  Mailgun (add-on de mailing para Heroku), configuracion inicial.-
#               Las variables de entorno las cargó el instalador de Mailgun directo en Heroku.-
#               La URL es la del deploy de esta app en Heroku (produccion).-
#
#   VERIFICADO! FUNCIONA EN DESARROLO Y PRODUCCION! 19.12.23
# 
#   IMPORTANTE!
#     En la consola de MAILGUN, se debe ir al Dominio (Sandbox) e ingresar las casillas REALES de
#     de destinatarios de mail que vaya a usar en mis pruebas en Heroku!!!
#     (Yo por ejemplo, registré mi propio mail de iCloud como destinatario válido, y asi pude luego
#       recibir el mail desde la app:)
#     Si no se registran casillas reales de destino en el dashboard de Mailgun, el servicio de mailing
#     no funciona, y la app de produccion (o sea el deploy online en Heroku) *cancela* sin dar
#     ninguna pista al respecto en el sitio ni el log de la app!
#
ActionMailer::Base.smtp_settings = {
  :port           => ENV['MAILGUN_SMTP_PORT'],
  :address        => ENV['MAILGUN_SMTP_SERVER'],
  :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
  :password       => ENV['MAILGUN_SMTP_PASSWORD'],
  :domain         => 'photo-app-je-d9cfce362fe9.herokuapp.com',
  :authentication => :plain
}
ActionMailer::Base.delivery_method = :smtp
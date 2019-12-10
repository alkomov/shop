ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: 587,
  domain: 'https://radiant-earth-60276.herokuapp.com/',
  user_name: ENV['alkomov'],
  password: ENV['4cE-Lw3-Pf4-RaM'],
  authentication: :login,
  enable_starttls_auto: true
}
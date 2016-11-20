OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_SECRET'], {
    # scope: ['https://mail.google.com/', 'email'],
    scope: ['https://www.googleapis.com/auth/gmail.readonly', 'email'],
    prompt: 'select_account'
    }
end

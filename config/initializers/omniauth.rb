# WebFinger.url_builder = URI::HTTP # default URI::HTTPS

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :openid_connect,
           name: 'openid_connect',
           scope: ['openid', 'profile', 'email'],
           response_type: 'code',
           issuer: 'https://oauth2id.test',
           client_auth_method: 'query',
           discovery: true,
           uid_field: 'email',
           client_options: {
             identifier: Rails.application.credentials.openid_connect_identifier!,
             secret: Rails.application.credentials.openid_connect_secret!,
             redirect_uri: 'https://omniauth-openid-connect-demo.test/auth/openid_connect/callback'
           }
end
